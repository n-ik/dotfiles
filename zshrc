export ZSH=~/.zsh

# Environment paths
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH

# Load all of the config files in ~/.zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/completions $fpath)

# Load and run compinit
autoload -U compinit
compinit

