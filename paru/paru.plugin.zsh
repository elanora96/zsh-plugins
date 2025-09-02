# Recursively removes true orphans and their configs
function murder_all_the_orphans() {
  if local orphans=$(paru -Qqdnt); then
    echo "$orphans" | paru -Rnsu -
  fi
}

