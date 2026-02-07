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

tma() {
  local target
  target="$(tmux list-sessions -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -rn | head -n1 | awk '{print $2}')"
  if [[ -n "$target" ]]; then
    tmux attach -t "$target"
  else
    tmux new-session -A -s main
  fi
}

tmk() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: tmk <session_name>"
    return 1
  fi
  read "reply?Kill tmux session '$name'? [y/N] "
  if [[ "$reply" == [yY] ]]; then
    tmux kill-session -t "$name"
  fi
}

tmr() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "usage: tmr <new_name>"
    return 1
  fi
  tmux rename-session "$name"
}

ta() {
  local target
  if ! tmux list-sessions >/dev/null 2>&1; then
    echo "No tmux sessions found."
    return 1
  fi

  if command -v fzf >/dev/null 2>&1; then
    target="$(tmux list-sessions -F '#S' | fzf --prompt='tmux> ' --height=40% --reverse)"
  else
    tmux list-sessions -F '#S'
    read "target?Attach to session: "
  fi

  [[ -n "$target" ]] && tmux attach -t "$target"
}

up() {
  local n="${1:-1}"
  local path=""
  local i

  if [[ "$n" != <-> ]] || (( n < 1 )); then
    echo "usage: up [positive_number]"
    return 1
  fi

  for ((i = 0; i < n; i++)); do
    path+="../"
  done
  cd "$path" || return
}

ports() {
  lsof -nP -iTCP -sTCP:LISTEN
}
