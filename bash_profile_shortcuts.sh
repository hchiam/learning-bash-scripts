# you could set these commands inside your .bash_profile so they can be used globally:
alias com='code ~/.bash_profile'
alias bas='source ~/.bash_profile' # so aliases in .bash_profile update and become available
alias clr='clear'
alias chr='open -na "Google Chrome" --args -incognito google.com'
alias frfx='open -a "Firefox"'
alias gml='open -na "Google Chrome" --args -incognito gmail.com'
alias dsq='open -na "Google Chrome" --args -incognito https://drive.google.com/drive/my-drive'
alias hi='echo "Hi. :)"'
alias gitdiff='git diff'
alias gitstatus='git status -sb'
alias gtis=gitstatus # handle common slight typo
alias gist=gitstatus # handle common slight typo
alias gots=gitstatus # handle common slight typo
alias gitinit='git init -b main'
alias gitreset='git reset'
alias gitadd='git add'
alias gitcommit='git commit -m $1'
alias gtic=gitcommit
alias gituncommit='git reset HEAD~1'
alias gitpushandstatus='git push; echo; echo -------; echo; gitstatus'
alias gitlog='git log --graph --oneline --decorate'
alias gitbranch='git branch'
alias cod='open -a "Visual Studio Code"'
alias hist='history; printf "\nTo clear history:\n\n histclr\n  or\n history -c; rm ~/.bash_history\n\n"'
alias histclr='history -c; rm ~/.bash_history; clr;'
alias des='clr; cd ~/Desktop; printf "\nDesktop:\n\n"; ls; echo ""'
alias ndm="nodemon -w index.js -x 'eslint --fix index.js; npm run lint; npm run test; node index.js;'"
alias checkdeviceaccessedby='lsof -nP -i4TCP'
alias zipup='zip -r ${PWD##*/}.zip * -x *.zip -x .husky/* -x node_modules/* -x ".github/*" -x .eslintignore -x .eslintrc.js -x .gitignore -x .travis.yml -x CODEOWNERS -x contributing.md; echo; echo "created ${PWD##*/}.zip inside this folder"; echo;'
alias loc='git ls-files | xargs wc -l' # lines of code
alias commitcount='git rev-list --all --count'
alias killmostrecentlybackgroundedjob='kill $!'
alias stopnode='killall node'
alias stopmongod='killall mongod'
alias sri='sha'
alias srv='python3 -m http.server 8000'
alias vt='vite'

function convenience() {
  # convenience nameOfConvenienceScriptBeingCreated
  echo
  echo "Creating convenience script repo: $1"
  echo
  gh repo create --template convenience "$1" --public
  gh repo clone "$1"
  cd "$1"
}

function learn() {
  # learn nameOfTheThingBeingLearned
  echo
  echo "Creating repo: learning-$1"
  echo
  gh repo create --template learning-template "learning-$1" --public
  gh repo clone "learning-$1"
  cd "learning-$1"
}
function learn-redirect() {
  # learn-redirect nameOfTheThingBeingLearned
  echo
  echo "Creating REDIRECT repo: learning-$1"
  echo
  gh repo create --template learning-redirect "learning-$1" --public
  gh repo clone "learning-$1"
  cd "learning-$1"
  git pull
  cod README.md
}

function project() {
  # project someProjectName
  echo
  echo "Creating repo: $1"
  echo
  gh repo create --template project-template "$1" --public
  gh repo clone "$1"
  cd "$1"
}

function ghsetup() {
  touch README.md .gitignore;
  echo "# Learning something

Just one of the things I'm learning. <https://github.com/hchiam/learning>" > README.md;
  echo "node_modules
.DS_Store
.env" > .gitignore;
  code README.md .gitignore;
}

function sha() { # usage: sha FILENAME.js
  tempShaOutput=$(cat $1 | openssl dgst -sha384 -binary | openssl base64 -A)
  echo sha384-$tempShaOutput
}

function tag() {
  git tag $1 && git push --tags
}

function ugly() { uglifyjs "$1" -o "$2" -m -c; }

function branch() {
  git checkout -b $1
  git push --set-upstream origin $1
}

function get_size() {
  if [ $# -eq 0 ] ; then
    echo "Enter the full path to the file."
    read file
    filesize=$(ls -lh $file | awk '{print  $5}')
    echo "$file has a size of $filesize"
  else
    filesize=$(ls -lh $1 | awk '{print  $5}')
    echo "$1 has a size of $filesize"
  fi
}
