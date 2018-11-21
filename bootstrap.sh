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

# Move old files to the backup folder
if [ -d "$HOME/.old_dotfiles" ]; then
  rm -rf ~/.old_dotfiles
fi

mkdir ~/.old_dotfiles
for file in ~/.{zshrc,zsh,tmux.conf,vimrc,nanorc,i3}; do
    mv $file ~/.old_dotfiles
    rm -rf $file
done;

# Set symlinks to dofiles
for file in {zshrc,zsh,tmux.conf,vimrc,nanorc,i3}; do
    ln -s ~/.dotfiles/$file ~/.$file;
done;

# Copy .vim/colors folder (symlinking does not work)
if  [ -d "$HOME/.vim" ]; then
  cp -af ~/.dotfiles/vim/colors ~/.vim/colors
else
  cp -af ~/.dotfiles/vim ~/.vim
fi

# Start zsh in bash on Windows
if [ -d "/mnt/c" ]; then
  cat <<EOF > ~/.bashrc
  # Launch zsh
  if [ -t 1 ]; then
  exec zsh
  fi
EOF
fi
