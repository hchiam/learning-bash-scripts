# You need to install gh cli first.
# https://github.com/hchiam/learning-gh

function learn-redirect() {
  # learn-redirect nameOfTheThingBeingLearned
  echo
  echo "Creating REDIRECT repo: learning-$1"
  echo
  gh repo create --template learning-redirect "learning-$1" --public
  gh repo clone "learning-$1"
  cd "learning-$1"
}