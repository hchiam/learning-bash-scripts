// put this inside your .bash_profile

function branch() {
  git checkout -b $1
  git push --set-upstream origin $1
}
