# just beforehand make sure to name the files alphabetically in the order you want them
convert -delay 50 $(ls *.jpg | sort -V) -resize 50% ten_commandments.gif
# convert comes from ImageMagick
