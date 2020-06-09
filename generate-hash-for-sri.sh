cat FILENAME.js | openssl dgst -sha384 -binary | openssl base64 -A
# or
shasum -b -a 384 FILENAME.js | awk '{ print $1 }' | xxd -r -p | base64

# (then append "sha384-" + the output to get the thing you'd put into the integrity attribute: https://github.com/hchiam/learning-sri)
