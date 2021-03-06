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
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Get week number
alias week="date +%V"

# Find Biggest Files and Directories
alias findBig="find -type f -exec du -Sh {} + | sort -rh | head -n 10"

# Notes
alias notes="vim ~/.notes"
