#!/bin/bash
this_dir="$(dirname "$0")"
cd $this_dir

# cross-platform package manager
# TODO: doesn't work on macOS catalina for now (2020-05-10)
curl -L https://nixos.org/nix/install | sh

# get system's package manager
package_manager_install_cmd=""
if command -v pacman >/dev/null 2>&1;
then
  package_manager_install_cmd="yay -S --cleanafter --noconfirm "
elif command -v brew >/dev/null 2>&1
then
  package_manager_install_cmd="brew install "
elif command -v apt-get >/dev/null 2>&1
then
  package_manager_install_cmd="sudo apt-get install -y "
else
  { echo >&2 "I require a package manager (apt-get, yay, brew) but it's not installed.  Aborting."; exit 1; }
fi

$package_manager_install_cmd git

# install zsh + hyper + starship
$package_manager_install_cmd zsh
$package_manager_install_cmd hyper
$package_manager_install_cmd starship
$package_manager_install_cmd ttf-fira-code

cp -r zsh/. ~/

# add suggestions + syntax highlighting
mkdir ~/.zsh
cd ~/.zsh
git clone git@github.com:zdharma/fast-syntax-highlighting.git
git clone git@github.com:zsh-users/zsh-autosuggestions.git


# install java
git clone https://github.com/gcuisinier/jenv.git ~/.jenv
$package_manager_install_cmd jdk8-adoptopenjdk
$package_manager_install_cmd jdk11-adoptopenjdk

jdk_install_path="/usr/lib/jvm/"
if [[ "$OSTYPE" =~ ^darwin ]]; then jdk_install_path="/Library/Java/JavaVirtualMachines/"
jdk8_install_path=$(find $jdk_install_path -name "*-8*")
jdk11_install_path=$(find $jdk_install_path -name "*-11*")
if [[ "$OSTYPE" =~ ^darwin ]]; then jdk8_install_path="$jdk8_install_path/Contents/Home"; jdk11_install_path="$jdk11_install_path/Contents/Home";

~/.jenv/bin/jenv add $jdk8_install_path
~/.jenv/bin/jenv add $jdk11_install_path
~/.jenv/binjenv global 11.0

# install development tools
$package_manager_install_cmd python
$package_manager_install_cmd ruby
$package_manager_install_cmd npm

# vscode
$package_manager_install_cmd vscodium
./vscode.sh
vscode_dir="$(find / -name 'VSCodium' 2>/dev/null | head -n 1)/User/"
cp vscode/settings.json $vscode_dir

# terminal utilities
$package_manager_install_cmd pgcli
$package_manager_install_cmd exa
$package_manager_install_cmd bat
$package_manager_install_cmd fd
npm install -g tldr
npm install -g fkill-cli
