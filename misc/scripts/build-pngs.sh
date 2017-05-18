#
# Build PNGs
# 
# Parameter list:
#   $1 - Size of PNGs 
#

# What size PNGs are we generating?
size=$1
echo "Generating PNGs of ${size}x${size} pixels"

# Figure out what conversion tool to use
# Currently either rsvg-convert or convert (ImageMagick) are supported
set +e

convertCmd=
convertArgs=

# Try rsvg-convert first
which rsvg-convert >> /dev/null
if [ $? -eq 0 ]; then
    convertCmd="rsvg-convert";
    convertArgs="-w $size -h ${size} -o"
else
    # Try ImageMagick convert second
    which convert >> /dev/null
    if [ $? -eq 0 ]; then
    # ImageMagick is installed, does it support svg input?
    convert -list delegate | grep "svg =" >> /dev/null
    if [ $? -eq 0 ]; then
        convertCmd="convert"
        convertArgs="-resize ${size}x${size}"
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
    $convertCmd "$i" $convertArgs "$filename"
    done

    # May need to create destination directory
    if [ ! -d $pngFolder ]; then
    mkdir $pngFolder
    fi

    # After that move files
    for i in `find $svgFolder -depth -name '*.png'`; do 
        filename=$(basename "$i") 
        extension="${filename##*.}"
        filename="${filename%.*}"
        # Move files from svg to png folder
        mv "$svgFolder/$filename.$extension" "$pngFolder/$filename.$extension"
    done
}

# Removes current folder and related size folder, create it new and fill it
clearAndConvert() {
    iconGroup=$1
    sizeDir=$2
    echo "Remove folder $PWD/png/$iconGroup/$sizeDir"
     
    # if related directory does not exists    
    if [ ! -e "$PWD/png" ]; then
        mkdir "$PWD/png"
    fi 
    
    if [ ! -e "$PWD/png/$iconGroup" ]; then
        mkdir "$PWD/png/$iconGroup"
    fi 
    
    if [ ! -e "$PWD/png/$iconGroup/$sizeDir" ]; then
        mkdir "$PWD/png/$iconGroup/$sizeDir"
    fi
    
    rm -rf "$PWD/png/$iconGroup/$sizeDir"
    mkdir "$PWD/png/$iconGroup/$sizeDir"
    svgToPng "$PWD/svg/$iconGroup" "$PWD/png/$iconGroup/$sizeDir"
}

# 
# Convert the various icon sets
#

# Action Icons
clearAndConvert "action" "$size"

# DataCube Icons
clearAndConvert "datacube" "$size"

# File Icons
clearAndConvert "file" "$size"

# FOAF Icons
clearAndConvert "foaf" "$size"

# Chart Icons
clearAndConvert "chart" "$size"

# Structure Icons
clearAndConvert "structure" "$size"

# Terms Icons
clearAndConvert "terms" "$size"

# Triplestore Icons
clearAndConvert "triplestore" "$size"

echo "Icon Conversion completed"

