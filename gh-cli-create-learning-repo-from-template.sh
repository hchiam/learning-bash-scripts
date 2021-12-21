# You need to install gh cli first.
# https://github.com/hchiam/learning-gh

function learn() {
  echo
  echo "Creating repo: learning-$1"
  echo
  gh repo create --template learning-template "learning-$1" --public
}