function ghsetup() {
  touch README.md .gitignore;
  echo "# Learning something

Just one of the things I'm learning. <https://github.com/hchiam/learning>" > README.md;
  echo "node_modules
.DS_Store
.env" > .gitignore;
  code README.md .gitignore;
}

ghsetup
