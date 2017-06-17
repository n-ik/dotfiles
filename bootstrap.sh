#!/bin/sh

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
mkdir ~/.old_dotfiles
for file in ~/.{zshrc,zsh,tmux.conf,vimrc,nanorc}; do
    mv $file ~/.old_dotfiles
    rm $file;
done;

# Set symlinks to dofiles
for file in .{zshrc,zsh,tmux.conf,aliases,vimrc,nanorc}; do
    ln -s ~/.dotfiles/$file ~/$file;
done;

#Sublime Text  
if [[ `uname` == 'Darwin' ]]; then
  #ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
  link "$HOME/.dotfiles/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
fi
