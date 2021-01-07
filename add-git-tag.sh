// put this inside your .bash_profile :

function tag() {
  git tag $1 && git push --tags
}
