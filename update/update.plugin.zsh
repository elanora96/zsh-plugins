function _p_print {
  print -P "%F{magenta}❯ $1 %f"
}

function upgrade_all {
  print -P "%F{cyan}If it has been a bit, maybe run reflecgrade()?%f"
  _p_print "paru -Syu"
  paru -Syu
  # _p_print "nix-channel --update"
  # nix-channel --update
  _p_print "rustup update"
  rustup update
  # _p_print "pipx upgrade-all"
  # pipx upgrade-all
  _p_print 'nvim --headless "+Lazy! sync" +qa'
  nvim --headless "+Lazy! sync" +qa
  _p_print "doom upgrade --aot -j 8 -!"
  doom upgrade
  _p_print "code --update-extensions"
  code --update-extensions
  _p_print "tldr --update"
  tldr --update
  _p_print "omz update"
  omz update
  _p_print "source ~/.zshrc"
  source "$HOME"/.zshrc
}

