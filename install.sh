#!/bin/bash
this_dir="$(dirname "$0")"
cd $this_dir

# Make sure to use zsh
chsh -s $(which zsh)
$(which zsh)

# get system's package manager
package_manager_install_cmd=""
if command -v pacman >/dev/null 2>&1; then
  package_manager_install_cmd="yay -S --cleanafter --noconfirm "
elif command -v brew >/dev/null 2>&1; then
  package_manager_install_cmd="brew cask install "
elif command -v apt-get >/dev/null 2>&1; then
  package_manager_install_cmd="sudo apt-get install -y "
  wget -qO – https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add –
  sudo add-apt-repository 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main'
  sudo add-apt-repository ppa:linrunner/tlp
  wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
  sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
  sudo apt update
else
  { echo >&2 "A supported package manager (apt-get, yay, brew) is required.  Aborting."; exit 1; }
fi

if ! command -v git >/dev/null 2>&1; then $package_manager_install_cmd git; fi

# install zsh + hyper + starship
if ! command -v zsh >/dev/null 2>&1; then $package_manager_install_cmd zsh; fi
if ! command -v hyper >/dev/null 2>&1; then $package_manager_install_cmd hyper; fi
if ! command -v starship >/dev/null 2>&1; then
  $package_manager_install_cmd starship
  $package_manager_install_cmd ttf-fira-code
fi

cp -r zsh/. ~/.zsh/

# add suggestions + syntax highlighting
mkdir ~/.zsh
cd ~/.zsh
if [ ! -d fast-syntax-highlighting ]; then git clone git@github.com:zdharma/fast-syntax-highlighting.git; fi
if [ ! -d zsh-autosuggestions ]; then git clone git@github.com:zsh-users/zsh-autosuggestions.git; fi

cd $this_dir

# install java
if ! command -v jenv >/dev/null 2>&1; then
  git clone https://github.com/gcuisinier/jenv.git ~/.jenv
  $package_manager_install_cmd jdk8-adoptopenjdk
  $package_manager_install_cmd jdk11-adoptopenjdk

  jdk_install_path="/usr/lib/jvm/"
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    jdk_install_path="/Library/Java/JavaVirtualMachines/"
  fi
  jdk8_install_path=$(find $jdk_install_path -name "*-8*")
  jdk11_install_path=$(find $jdk_install_path -name "*-11*")
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    jdk8_install_path="$jdk8_install_path/Contents/Home"
    jdk11_install_path="$jdk11_install_path/Contents/Home"
  fi
  ~/.jenv/bin/jenv add $jdk8_install_path
  ~/.jenv/bin/jenv add $jdk11_install_path
  ~/.jenv/binjenv global 11.0
fi

# install docker
$package_manager_install_cmd docker

# install development tools
if ! command -v python >/dev/null 2>&1; then $package_manager_install_cmd python; fi
if ! command -v ruby >/dev/null 2>&1; then $package_manager_install_cmd ruby; fi
if ! command -v npm >/dev/null 2>&1; then $package_manager_install_cmd npm; fi

# vscode
if ! command -v code >/dev/null 2>&1; then
  $package_manager_install_cmd codium
  chmod +x vscode/install_extensions.sh
  ./vscode/install_extensions.sh
  vscode_dir="$(find / -name 'VSCodium' 2>/dev/null | head -n 1)/User/"
  cp vscode/settings.json $vscode_dir
fi

# power-saving utilities for laptops
$package_manager_install_cmd tlp tlp-rdw powertop
chmod +x power/savings_setup.sh
./power/savings_setup.sh

# blue-light filter
$package_manager_install_cmd redshift
cp redshift/redshift.conf ~/.config/redshift.conf

# browser config
profile_dir=$(sudo find / -name "*default-release" 2>/dev/null | grep -m 1 mozilla)
mkdir $profile_dir/chrome/
cp browser/userChrome.css $profile_dir/chrome/
cp browser/user.js $profile_dir/

# terminal utilities
if ! command -v pgcli >/dev/null 2>&1; then $package_manager_install_cmd pgcli; fi
if ! command -v exa >/dev/null 2>&1; then $package_manager_install_cmd exa; fi
if ! command -v bat >/dev/null 2>&1; then $package_manager_install_cmd bat; fi
if ! command -v fd >/dev/null 2>&1; then $package_manager_install_cmd fd; fi
if ! command -v tldr >/dev/null 2>&1; then npm install -g tldr; fi
if ! command -v fkill >/dev/null 2>&1; then npm install -g fkill-cli; fi

# media software
$package_manager_install_cmd vlc
