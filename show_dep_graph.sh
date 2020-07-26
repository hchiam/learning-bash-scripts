#!/bin/bash

# To run this file: bash show_dep_graph.sh

function askForMaxDepth() {
  read -p "Enter max depth: " maxDepth
}

function installDotIfMissing() {
  if ! [ -x "$(command -v dot)" ]; then
    echo 'Error: dot graphviz is not set up or installed. Attempting install now.'
    brew install graphviz
  fi
}

function getSrcFolder() {
  read -p "Enter src folder (or folder or file you'd like to inspect): " srcFolder
}

function createDependencyGraph() {
  re='^[0-9]+$'
  if ! [[ $maxDepth =~ $re ]] ; then
    # don't use maxDepth if it's not a number
    depcruise --exclude "^node_modules" --output-type dot $srcFolder | dot -T svg > dependencygraph.svg
  else
    depcruise --max-depth $maxDepth --exclude "^node_modules" --output-type dot $srcFolder | dot -T svg > dependencygraph.svg
  fi
}

function showDependencyGraph() {
  echo 'Trying to open dependencygraph.svg in a browser.'
  # try to open in Firefox or Chrome
  open -a "Firefox" dependencygraph.svg || \
  open -a "Google Chrome" dependencygraph.svg || true
}

askForMaxDepth
installDotIfMissing
# if [ ! -d src ]; then
#   echo "src folder missing"
  getSrcFolder
# else
#   srcFolder="src"
# fi
createDependencyGraph
showDependencyGraph

# Example outputs:
# https://raw.githubusercontent.com/hchiam/learning-dependency-cruiser/879baa9074b550d87bd3f23203022ca35a31850d/dependencygraph.svg
# https://raw.githubusercontent.com/hchiam/code-inspiration/d2301787478c917812d0a82a7d1803d515f6a35c/dependencygraph.svg

# UPDATE:
# https://github.com/hchiam/deps
# YOU CAN NOW INSTALL A CLI COMMAND GLOBALLY FOR USE IN ANY FOLDER.
