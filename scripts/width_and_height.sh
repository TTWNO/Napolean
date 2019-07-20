get_image_width() {
	echo $(identify $1 | cut -d' ' -f3 | cut -dx -f1)
}
get_image_height() {
	echo $(identify $1 | cut -d' ' -f3 | cut -dx -f2)
}
