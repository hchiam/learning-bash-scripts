# You can set this in your .bash_profile:
function ugly() { uglifyjs "$1" -o "$2" -m -c; }
# now you can do type less and do something like this: ugly input.js output.js
