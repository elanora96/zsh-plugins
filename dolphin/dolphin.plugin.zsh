# Silently launch dolphin
function sdolphin() {
  nohup dolphin "$@" &>/dev/null &
  disown
}

