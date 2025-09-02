function _print_n_run {
  gum style --background 99 "$1" && eval "$1"
}

function upgrade_all {
  local -A hashmap
  hashmap=(
    "reflector"   "reflecgrade"
    "paru"        "paru -Syu"
    "rustup"      "rustup update"
    "nvim"        'nvim --headless "+Lazy! sync" +qa'
    "doom"        "doom upgrade --aot -j 8 -!"
    "code"        "code --update-extensions"
    "tldr"        "tldr --update"
    "sheldon"     "sheldon lock --update"
  )

  # Ask what to upgrade, returns a string array of keys
  local commands=$(gum choose --no-limit --ordered "${(@k)hashmap}" --selected="*")

  # If the key is in the list, eval the command in the value
  # It makes more sense to loop through the array
  # But shell remains so weird to me so I'm just doing it the way I could make work
  for key in "${(@k)hashmap}"; do
    if (( "$commands[(I)$key]" )); then
        _print_n_run "${hashmap[$key]}"
    fi
  done

  # Source .zshrc to remove weird edge cases
  _print_n_run "source $HOME/.zshrc"
}
