# Should be able to archive most sites
# -mpckE == mirror page-requisites continue konvert Extension
# Recursively traverses the whole site, downloads all static assets, and converts pathnames 
function wget-archive() {
  # Get the current Firefox Version number so this script stays relevant
  FFV=$(firefox --version | awk '{print $3}')
  UA="Mozilla/5.0 (X11; Linux x86_64; rv:$FFV) Gecko/20100101 Firefox/$FFV"

  wget \
    -mpckE \
    --user-agent="$UA" \
    -e robots=off \
    --wait 2 \
    "$@"
}

