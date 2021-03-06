# To run this file: bash pyCodeFeedback.sh

function installPylintIfMissing() {
  if ! [ -x "$(command -v pylint)" ]; then
    echo 'Error: pylint is not installed.'
    pip install pylint
  fi
}

function giveFeedback() {
  # test all python files in the folder that contains this bash script:
  pylint *.py
  # example: file-being-tested.py:1:0: C0111: Missing module docstring (missing-docstring)
  # 1:0 means "line 1, character at index 0"
}

installPylintIfMissing
giveFeedback
