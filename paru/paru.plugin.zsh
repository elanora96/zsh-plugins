# Recursively removes true orphans and their configs
function murder_all_the_orphans() {
  if orphans=$(paru -Qqdt); then
    echo "$orphans" | paru -Rns -
  fi
}

