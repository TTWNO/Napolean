source ./width_and_height.sh

# The camera captures at this size
# it is in inches
CAPTURE_WIDTH=16.5
CAPTURE_HEIGHT=12

IMAGE_WIDTH=$(get_image_width $1)
IMAGE_HEIGHT=$(get_image_height $1)

# Pass in the width via paramaters
BOOK_WIDTH=$2
BOOK_HEIGHT=$3

BOOK_WIDTH_PERCENTAGE=$(echo "scale=2; $BOOK_WIDTH / $CAPTURE_WIDTH" | bc)
BOOK_HEIGHT_PERCENTAGE=$(echo "scale=2; $BOOK_HEIGHT / $CAPTURE_HEIGHT" | bc)

echo "Width: $BOOK_WIDTH/$CAPTURE_WIDTH = $BOOK_WIDTH_PERCENTAGE"
echo "Height: $BOOK_HEIGHT/$CAPTURE_HEIGHT = $BOOK_HEIGHT_PERCENTAGE"

# The cut command removes the decimal point
PIXEL_WIDTH_CALC="$IMAGE_WIDTH * $BOOK_WIDTH_PERCENTAGE"
PIXEL_HEIGHT_CALC="$IMAGE_HEIGHT * $BOOK_HEIGHT_PERCENTAGE"
CROPPED_WIDTH=$(echo "$PIXEL_WIDTH_CALC" | bc | cut -d. -f1)
CROPPED_HEIGHT=$(echo "$PIXEL_HEIGHT_CALC" | bc | cut -d. -f1)

echo "Width (in px): $CROPPED_WIDTH"
echo "Height (in px): $CROPPED_HEIGHT"

# Crop by this many pixels on the left and right
TRIM_WIDTH=$(echo "($IMAGE_WIDTH - $CROPPED_WIDTH) / 2" | bc)
# Crop by this many pixels on the top and bottom
TRIM_HEIGHT=$(echo "($IMAGE_HEIGHT - $CROPPED_HEIGHT) / 2" | bc)

echo "Trim by width: $TRIM_WIDTH"
echo "Trim by height: $TRIM_HEIGHT"

echo "Cropping image!"
convert $1 -crop ${CROPPED_WIDTH}x${CROPPED_HEIGHT}+${TRIM_WIDTH}+${TRIM_HEIGHT} cropped.jpg 
echo "Cropping complete!"
