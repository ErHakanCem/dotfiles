cd
export EDITOR='vim'
export PATH="$HOME/bin:$PATH"

export BROWSER="explorer.exe"
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=HISTFILESIZE  
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s autocd
# vim-instant-markdown
# filetype plugin on
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
export PS1="\[\033[38;5;11m\]\A\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;11m\][\[$(tput sgr0)\]\u\[$(tput sgr0)\]\[\033[38;5;11m\]]\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]"



#Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
## See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# inserted by me {{{
# fzf default line
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
bind '"\C-o":"open_with_fzf\n"'

open_with_fzf() {
	fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | xargs -ro -d "\n" vim 2>&-
}


export NOTES_DIR=~/notes
n() { 
$EDITOR ~/notes/"$(date "+%Y%m%d%H%M")$*".txt
} 
nls() { 
ls -c ~/notes/ | grep '$*' 
}

# A mapping to convert the current markdown file to HTML could look like:
# nnoremap <leader>r :!pandoc % --to=html5 > %.html

# taskwarior 
export TIMEWARRIORDB=~/task/timew
export TASKRC=~/task/.taskrc
#eval "$(starship init bash)"

