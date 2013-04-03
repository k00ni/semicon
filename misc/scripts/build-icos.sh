#
# Build ICOs
# 

# Ensure ICO directory exists
if [ ! -e "$PWD/../ico" ]; then
  mkdir "$PWD/../ico"
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
#  $1 - PNG Source Folder
#  $2 - ICO Destination Folder
svgToIco() {
  svgFolder=$1
  pngFolder=$2
  icoFolder=$3

  echo "Converting from PNGs in sub-directories of $pngFolder to ICOs in directory $icoFolder"

  # First convert svg's to ico's
  for i in `find $svgFolder -depth -name '*.svg'`; do
    pngFilename=`echo $i | sed -e 's/svg$/png/'`
    filename=`echo $i | sed -e 's/svg$/ico/'`
    inFile=$(basename "$pngFilename")

    # Build up the conversion arguments
    # We have to do this for every icon since we are generating the arguments
    # from the list of available PNGs
    convertArgs=
    for dir in $pngFolder/*; do
      if [ -d "$dir" ]; then
        convertArgs="$convertArgs ( $dir/$inFile )"
      fi
    done
    if [ -z "$convertArgs" ]; then
      echo "No PNGs detected in $pngFolder, please generate PNGs prior to running this script"
      exit 1
    fi
    convertArgs="$convertArgs -alpha on"
    $convertCmd "$i" $convertArgs "$filename"
  done

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
    if [ -e "$PWD/../ico/$iconGroup" ]; then
      echo "Remove folder $PWD/../ico/$iconGroup"
      rm -rf "$PWD/../ico/$iconGroup/"
    fi
    mkdir "$PWD/../ico/$iconGroup/"
    svgToIco "$PWD/../svg/$iconGroup" "$PWD/../png/$iconGroup" "$PWD/../ico/$iconGroup"
}

# 
# Convert the various icon sets
#

# Action Icons
clearAndConvert "action"

# DataCube Icons
clearAndConvert "datacube"

# File Icons
clearAndConvert "file"

# Structure Icons
clearAndConvert "structure"

# Terms Icons
clearAndConvert "terms"

# Triplestore Icons
clearAndConvert "triplestore"

echo "Icon Conversion completed"

