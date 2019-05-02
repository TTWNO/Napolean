W=$(convert $1 -print "%w" /dev/null)
H=$(convert $1 -print "%h" /dev/null)
# Half width
HW=$(($W / 2))

# half-width wide, height tall, start at pixel 0
convert $1 -colorspace gray -crop ${HW}x${H}+0+0 left.jpg
# half-wdith wide, height tall, start at half width
convert $1 -colorspace gray -crop ${HW}x${H}+${HW}+0 right.jpg