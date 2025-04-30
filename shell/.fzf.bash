# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ahmetomay/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/ahmetomay/.fzf/bin"
fi

eval "$(fzf --bash)"
