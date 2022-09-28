#!/bin/bash

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