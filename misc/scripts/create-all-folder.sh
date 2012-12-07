#
# Move all SVG's to svg/all and do the same for PNG's
#

# Set folder paths
allFolder="$PWD/../svg/all"
rootFolder="$PWD/../svg/namespace"

for i in `find $rootFolder -depth -name '*.svg'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done
