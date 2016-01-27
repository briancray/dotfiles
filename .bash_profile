# Add ~/bin to PATH
export PATH="$PATH:$HOME/bin"

# Set colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# command history settings
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:pwd:date:'
export HISTFILESIZE=5000

# Run dotfiles in ~
for file in ~/.{aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Function to add get git branch
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set bash prompt
export PS1="\[\033[01;32m\]\u@$ROLENAME\[\033[01;34m\]\$(parse_git_branch)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Any overrides
if [ -f ~/.bash_profile.local ]; then
    . ~/.bash_profile.local
fi
