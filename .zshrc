export ZSH=~/.zsh

# Environment paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Load all of the config files in ~/.zsh that end in .zsh
for config_file ($ZSH/*.zsh) source $config_file

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/completions $fpath)

# Autocomplete for brew packages
fpath=(/usr/local/share/zsh/site-functions $fpath)  

# Load and run compinit
autoload -U compinit
compinit -i

