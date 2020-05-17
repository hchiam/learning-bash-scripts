#!/bin/bash

# To run this file: bash zip_all_in_this_folder.sh

zip -r compressed_folder.zip * -x "node_modules/*"

# or you could set up an alias to use globally:
# alias zipup='zip -r ${PWD##*/}.zip * .eslintignore .eslintrc.js .gitignore .travis.yml -x "node_modules/*"; echo; echo "created ${PWD##*/}.zip inside this folder"; echo;'

echo
echo "created compressed_folder.zip inside this folder"
echo
