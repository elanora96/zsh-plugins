function reflecgrade() {
  doas reflector --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist "$@"
}

