cat <(echo "// A comment to prepend") script.js > temp.js
mv temp.js script.js

# There are a few other ways to prepend text, with pros and cons: 
# https://stackoverflow.com/questions/10587615/unix-command-to-prepend-text-to-a-file
