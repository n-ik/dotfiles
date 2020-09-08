export ZSH=~/.zsh

# Environment paths
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:/usr/local/go/bin

# Load all of the config files in ~/.zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/completions $fpath)

# Load and run compinit
autoload -U compinit
compinit

