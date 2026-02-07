# tmux helpers
tm() {
  local name="${1:-main}"
  tmux attach -t "$name"
}

tmn() {
  local name
  if [[ -n "$1" ]]; then
    name="$1"
  else
    name="s-$(date +%Y%m%d-%H%M%S)"
    echo "tmux session: $name"
  fi
  tmux new-session -A -s "$name"
}

alias tms="tmux list-sessions"
