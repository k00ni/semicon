#
# Move all SVG's to svg/all and do the same for PNG's
#

# Set folder paths
allFolder="$PWD/../svg/all"

rootFolder="$PWD/../svg/file"

for i in `find $rootFolder -depth -name '*.svg'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../svg/namespace"

for i in `find $rootFolder -depth -name '*.svg'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../svg/structure"

for i in `find $rootFolder -depth -name '*.svg'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../svg/triplestore"

for i in `find $rootFolder -depth -name '*.svg'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done


# Set folder paths
allFolder="$PWD/../png/all"

rootFolder="$PWD/../png/file"

for i in `find $rootFolder -depth -name '*.png'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../png/namespace"

for i in `find $rootFolder -depth -name '*.png'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../png/structure"

for i in `find $rootFolder -depth -name '*.png'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done

rootFolder="$PWD/../png/triplestore"

for i in `find $rootFolder -depth -name '*.png'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    cp "$rootFolder/$filename.$extension" "$allFolder/$filename.$extension"
done
