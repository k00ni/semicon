#
# BUILD NAMESPACE ICONS 
#

# Figure out what conversion tool to use
# Currently either rsvg-convert or convert (ImageMagick) are supported
set +e

convertCmd=
convertArgs=

# Try rsvg-convert first
which rsvg-convert >> /dev/null
if [ $? -eq 0 ]; then
    convertCmd="rsvg-convert";
    convertArgs="-o"
else
    # Try ImageMagick convert second
    which convert >> /dev/null
    if [ $? -eq 0 ]; then
	# ImageMagick is installed, does it support svg input?
	convert -list delegate | grep "svg =" >> /dev/null
	if [ $? -eq 0 ]; then
	        convertCmd="convert"
	else
		# convert installed but no SVG support
		echo "Error - ImageMagick convert is installed but no SVG support appears to be installed"
		exit 1
	fi
    else
	# Neither rsvg-convert or ImageMagick convert are installed
        echo "Error - No suitable convert utility available, install rsvg-convert or ImageMagick convert"
        exit 1
    fi
fi
set -e
convertCmdPath=`which $convertCmd`
echo "Using conversion utility $convertCmd from $convertCmdPath"

# Conversion Function
svgToPng() {
    svgFolder=$1
    pngFolder=$2

    echo "Converting from SVGs in directory $svgFolder to PNGs in directory $pngFolder"

    # First convert svg's to png
    for i in `find $svgFolder -depth -name '*.svg'`; do
        filename=`echo $i | sed -e 's/svg$/png/'`
        $convertCmd "$i" $convertArgs "$filename";
    done

    # After that move files
    for i in `find $svgFolder -depth -name '*.png'`; do 
        filename=$(basename "$i") 
        extension="${filename##*.}"
        filename="${filename%.*}"
        # Move files from svg to png folder
        mv "$svgFolder/$filename.$extension" "$pngFolder/$filename.$extension"
    done
}

# Convert the various icon sets

# Structure Icons
svgToPng "$PWD/../svg/structure" "$PWD/../png/structure"

# Terms Icons
svgToPng "$PWD/../svg/terms" "$PWD/../png/terms"

# Triplestore Icons
svgToPng "$PWD/../svg/triplestore" "$PWD/../png/triplestore"

echo "Icon Conversion completed"

