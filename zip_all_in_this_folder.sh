#!/bin/bash

# To run this file: bash zip_all_in_this_folder.sh

zip -r compressed_folder.zip * -x "node_modules/*"

echo
echo "created compressed_folder.zip inside this folder"
echo
