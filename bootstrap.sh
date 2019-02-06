#!/usr/bin/env bash

# Set gitconfig
if [ ! -f ~/.gitconfig ]; then
echo 'What is your git author name?'
read -e git_authorname

echo 'What is your git author email?'
read -e git_authoremail

git config --global user.name "$git_authorname"
git config --global user.email $git_authoremail
fi

# Remove old files
for file in ~/.{zshrc,zsh,tmux.conf,vimrc,nanorc}; do
    rm -rf $file
done;

# Set symlinks to dofiles
for file in {zshrc,zsh,tmux.conf,vimrc,nanorc}; do
    ln -s ~/.dotfiles/$file ~/.$file;
done;

# Start zsh in bash on Windows
if [ -d "/mnt/c" ]; then
  cat <<EOF > ~/.bashrc
  # Launch zsh
  if [ -t 1 ]; then
  exec zsh
  fi
EOF
fi
