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
mkdir ~/.old_dotfiles
for file in ~/.{zshrc,zsh,tmux.conf,vimrc,nanorc}; do
    mv $file ~/.old_dotfiles
    rm $file;
done;

# Set symlinks to dofiles
for file in .{zshrc,zsh,tmux.conf,vimrc,nanorc}; do
    ln -s ~/.dotfiles/$file ~/$file;
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

#Sublime Text
## MacOS
if [[ `uname` == 'Darwin' ]]; then
  #ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
  link "$HOME/.dotfiles/sublime/Packages/User/MacOSPreferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
fi

## Bash on Windows
# mklink "C:\Users\%USERNAME%\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" "C:\Users\%USERNAME%\AppData\Local\lxss\home\%USERNAME%\.dotfiles\sublime\Packages\User\winPreferences.sublime-settings"
