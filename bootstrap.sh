#!/usr/bin/env bash
set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts/local"
# Main playbook
PLAYBOOK="$ROOTDIR/dotfiles.yml"

# Get system's package manager
INSTALL_CMD=""
if command -v pacman >/dev/null 2>&1; then
  INSTALL_CMD="yay -S --cleanafter --noconfirm "
elif command -v brew >/dev/null 2>&1; then
  INSTALL_CMD="brew cask install "
elif command -v dnf >/dev/null 2>&1; then
  INSTALL_CMD="sudo dnf install -y "
elif command -v apt-get >/dev/null 2>&1; then
  INSTALL_CMD="sudo apt-get install -y "
  sudo apt update
else
  { echo >&2 "A supported package manager (apt-get, yay, brew, yum, dnf) is required.  Aborting."; exit 1; }
fi

# Installs ansible
$INSTALL_CMD ansible
ansible-galaxy install geerlingguy.java
ansible-galaxy install iancleary.jetbrains_mono
ansible-galaxy install ontic.fonts

# Runs Ansible playbook using our user.
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0
