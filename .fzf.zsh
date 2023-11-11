# Setup fzf
# ---------
if [[ ! "$PATH" == */home/gmf/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/gmf/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/gmf/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/gmf/.fzf/shell/key-bindings.zsh"
