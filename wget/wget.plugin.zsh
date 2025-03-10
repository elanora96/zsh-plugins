# Should be able to archive most sites
# -mpckE == mirror page-requisites continue konvert Extension
# Recursively traverses the whole site, downloads all static assets, and converts pathnames 
function wget-archive() {
  wget \
    -mpckE \
    --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101 Firefox/136.0" \
    -e robots=off \
    --wait 2 \
    "$@"
}

