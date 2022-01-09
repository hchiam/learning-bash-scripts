# You need to install gh cli first.
# https://github.com/hchiam/learning-gh

function learn() {
  # learn nameOfTheThingBeingLearned
  echo
  echo "Creating repo: learning-$1"
  echo
  gh repo create --template learning-template "learning-$1" --public
  gh repo clone "learning-$1"
}