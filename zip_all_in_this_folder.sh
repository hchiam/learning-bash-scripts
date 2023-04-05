#!/bin/bash

# To run this file: bash zip_all_in_this_folder.sh

zip -r compressed_folder.zip * -x "node_modules/*" -x "*.zip"

# or you could set up an alias to use globally:
# alias zipup='zip -r ${PWD##*/}.zip * -x *.zip -x .husky/* -x node_modules/* -x ".github/*" -x .eslintignore -x .eslintrc.js -x .gitignore -x .travis.yml -x CODEOWNERS -x contributing.md; echo; echo "created ${PWD##*/}.zip inside this folder"; echo;'

echo
echo "created compressed_folder.zip inside this folder"
echo
