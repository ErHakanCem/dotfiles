## get rid of command not found ##
alias cd..='cd ..'
# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
# make color with lsd plugin
alias ls='lsd'
alias l='ls --color -h --group-dirs first'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
# Show hidden files #
alias l.='ls -ld .*'
# use bat instead cat
alias cat='bat'
alias python='python3.8'
alias pip='pip3.8'
## Colorize the grep command output for ease of use (good for log files)##
alias gp='grep --color=auto'
alias egp='egrep --color=auto'
alias fgp='fgrep --color=auto'
# shortcuts
alias s="vim self/self.md"        
alias i='vim notes/index.md'
alias v='vim'
alias ta='task add'
alias td='task delete'
alias t='task'
alias tcn='task context none'
alias tp='task projects'
alias tlm='task +LATEST modify'
alias taskopen='taskopen -c ~/task/taskopen/.taskopenrc'

alias j="vim +'normal Go' +'r!date' ~/journal.txt"
alias g="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/goals.txt"
alias p="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/plans.txt"
alias ts="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/thoughts.txt"
#alias osw="vim -O ~/self/self.md ~/work/work.md"
alias dd="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/did.txt"
alias ntd="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/next.todo.txt"
alias dg="echo `date "+%Y-%m-%d %H:%M:%S"`'> '"$*" >> ~/self/now.txt"
#alias lgs="vim ~/self/`mktemp logs.XXXXXXXXXXXXXXXX.txt` +'r!date' "

# alias notes.art=vim `mktemp -p ~/Documents 700-XXXXXXX --suffix=.md`
# open vim session of journal 
# ? alias oj='vim -S ~/.vim/sessions/journal.vim'

# old ?
#alias bup="rsync -zavh --include='.vim' --exclude 'task*/' --exclude 'node.*/' ./*/  /mnt/y/LinuxBackup/"
alias bup="rsync -zavh --include-from='include.txt' ./ /mnt/y/LinuxBackup/"
alias gbup='rsync -zavh --include=".vim" --exclude=".*/" ./*  /mnt/y/Google\ Drive/LinuxBackup/'
#alias wn='bash ~/scripts/random.name.file.sh'
#alias wl='TMPFILE=`mktemp ~/work/pages/logs/logs.XXXXXXXXXXXXXXXX` &&  cat >> $TMPFILE'
#alias sl='TMPFILE=`mktemp ~/self/pages/logs/logs.XXXXXXXXXXXXXXXX` &&  cat >> $TMPFILE'

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() (
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
)

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
