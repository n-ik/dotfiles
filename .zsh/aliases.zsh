# Aliases for MacOS
if [ "$(uname -s)" = "Darwin" ]; then
  alias notes='cd ~/Documents/Notes'
fi

# Aliases for bash on Windows
if [ -d "/mnt/c" ]; then
  alias standup='vim ~/Notes/Work/standup.md'
  alias scratch='vim ~/Notes/Work/scratch.md'
  alias notes='cd ~/Notes/Work/Notes'
  alias workdir='cd /mnt/c/work_java/'
fi

# Detect which `ls` flavor is in use
if [ -d /mnt/c ]; then # WindowsBash ´ls´
    colorflag="--color=auto"
elif ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias ll="ls -laF ${colorflag}"

# List only directories
alias ld="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Get week number
alias week='date +%V'
