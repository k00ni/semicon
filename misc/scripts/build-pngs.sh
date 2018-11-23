#
# Build PNGs
#
# Parameter list:
#   $1 - Size of PNGs
#

# What size PNGs are we generating?
size=$1
echo "Generating PNGs of ${size}x${size} pixels"

set +e

which inkscape >> /dev/null
if [ $? -ne 0 ]; then
    # Neither rsvg-convert or ImageMagick convert are installed
    echo "Error - No suitable convert utility available, install inkscape"
    exit 1
fi
set -e

# remove and recreate PNG dir
pngdir=./icons/png/"$size"x"$size"

if [ -d $pngdir ]; then
    rm -r $pngdir
fi

mkdir $pngdir

for filename in ./icons/svg/*.svg; do
    # extract basename without extension
    filename=$(basename -- "$filename")
    filename="${filename%.*}"

    # convert SVG to PNG using inkscape
    inkscape -z -e $pngdir"/$filename.png" -w $size -h $size ./icons/svg/$filename.svg
done
