# Ensure that calibre-server:
# - is set to start on calibre startup
# - runs on port 8084
# - has a user "guest" with a password "books" (this is my read-only user)
# Otherwise, this can only run when calibre is not running
function calibre-books() {
  tty=""
  if [[ -t 1 ]]; then
    tty="True"
  fi

  calibre_server_address=http://localhost:8084

  ansi_bold="\033[1m"
  ansi_bright_blue="\033[34m"
  ansi_default="\033[0m"

  calibre_library=""

  # If calibre is running, we have to connect through calibre-server
  # Otherwise, we can access the db directly
  if [[ "$(pgrep -f 'calibre')" ]]; then
    calibre_library=$(calibredb --with-library "$calibre_server_address" --username guest --password books list --for-machine)
  else
    calibre_library=$(calibredb list --for-machine)
  fi

  echo "$calibre_library" |
    jq -r 'sort_by(.authors)[] | "\(.authors) - \(.title)"' |
    awk -v tty="$tty" -v bold="$ansi_bold" -v author_color="$ansi_bright_blue" -v reset="$ansi_default" '
    {
      split($0, parts, " - ");
      if (tty) {
        print bold author_color parts[1] reset " - " parts[2];
      } else {
        print parts[1] " - " parts[2];
      }
    }'
}

