echo sha384-$(cat FILENAME.js | openssl dgst -sha384 -binary | openssl base64 -A)
# or
echo sha384-$(shasum -b -a 384 FILENAME.js | awk '{ print $1 }' | xxd -r -p | base64)

# (the output is the thing you'd put into the integrity attribute: https://github.com/hchiam/learning-sri)

# Or just do this in your .bash_profile:

function sha() { # usage: sha FILENAME.js
  tempShaOutput=$(cat $1 | openssl dgst -sha384 -binary | openssl base64 -A)
  echo sha384-$tempShaOutput
}
