#!/bin/bash

# move zsh config over 
cd "$(dirname "$0")"
cp zsh/* ~/

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

# install zsh + hyper + starship
$package_manager_install_cmd zsh
$package_manager_install_cmd hyper
$package_manager_install_cmd starship
$package_manager_install_cmd ttf-fira-code

