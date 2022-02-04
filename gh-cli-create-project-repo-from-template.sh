# You need to install gh cli first.
# https://github.com/hchiam/learning-gh

function project() {
  # project someProjectName
  echo
  echo "Creating repo: $1"
  echo
  gh repo create --template project-template "$1" --public
  gh repo clone "$1"
  cd "$1"
}