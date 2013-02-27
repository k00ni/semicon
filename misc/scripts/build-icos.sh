#
# Build ICOs
# 
# Parameter list:
#   One/More arguments denoting sizes you wish to include in the ICO
#

# Did we get any arguments
if [ $# -eq 0 ]; then
  echo "No arguments, build-icos.sh requires a series of numbers denoting the sizes of icons to include in the ICO files"
  exit 1
fi

echo "Converting SVGs to ICOs"

# Figure out what conversion tool to use
# Only convert (ImageMagick) is supported
set +e

convertCmd=
convertArgs=

# Is ImageMagick installed
which convert >> /dev/null
if [ $? -eq 0 ]; then
  # ImageMagick is installed, does it support svg input?
  convert -list delegate | grep "svg =" >> /dev/null
  if [ $? -eq 0 ]; then
    convertCmd="convert"

    # Build up the conversion arguments
    for size in $@
    do
      convertArgs="$convertArgs ( -clone 0 -resize ${size}x${size} )"
    done
    convertArgs="$convertArgs -delete 0 -colors 256 -alpha on"
  else
    # convert installed but no SVG support
    echo "Error - ImageMagick convert is installed but no SVG support appears to be installed"
    exit 1
  fi
else
  # ImageMagick convert are installed
  echo "Error - No suitable convert utility available, install ImageMagick convert"
  exit 1
fi

set -e
convertCmdPath=`which $convertCmd`
echo "Using conversion utility $convertCmd from $convertCmdPath"

# Conversion Function
# Arguments:
#  $1 - SVG Source Folder
#  $2 - ICO Destination Folder
svgToIco() {
  svgFolder=$1
  icoFolder=$2

  echo "Converting from SVGs in directory $svgFolder to ICOs in directory $icoFolder"

  # First convert svg's to ico's
  for i in `find $svgFolder -depth -name '*.svg'`; do
    filename=`echo $i | sed -e 's/svg$/ico/'`
    $convertCmd "$i" $convertArgs "$filename"
  done

  # May need to create destination directory
  if [ ! -d $icoFolder ]; then
    mkdir $icoFolder
  fi

  # After that move files
  for i in `find $svgFolder -depth -name '*.ico'`; do 
    filename=$(basename "$i") 
    extension="${filename##*.}"
    filename="${filename%.*}"
    # Move files from svg to ico folder
    mv "$svgFolder/$filename.$extension" "$icoFolder/$filename.$extension"
  done
}

# Removes current folder and related size folder, create it new and fill it
clearAndConvert() {
    iconGroup=$1
    echo "Remove folder $PWD/../ico/$iconGroup"
    rm -rf "$PWD/../ico/$iconGroup/"
    mkdir "$PWD/../ico/$iconGroup/$"
    svgToIco "$PWD/../svg/$iconGroup" "$PWD/../ico/$iconGroup/"
}

# 
# Convert the various icon sets
#

# Action Icons
clearAndConvert "action"

# File Icons
clearAndConvert "file"

# Structure Icons
clearAndConvert "structure"

# Terms Icons
clearAndConvert "terms"

# Triplestore Icons
clearAndConvert "triplestore"

echo "Icon Conversion completed"

