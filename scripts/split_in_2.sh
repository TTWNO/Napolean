W=$(get_image_width $1)
H=$(get_image_height $1)
# Half width
HW=$(($W / 2))
OPTIONS=(-colorspace gray -fill white -sharpen 0x2)

# half-width wide, height tall, start at pixel 0
convert $1 "${OPTIONS[@]}" -crop ${HW}x${H}+0+0 left.jpg
# half-wdith wide, height tall, start at half width
convert $1 "${OPTIONS[@]}" -crop ${HW}x${H}+${HW}+0 right.jpg
