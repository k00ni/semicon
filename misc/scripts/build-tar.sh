#
# BUILD ARCHIVES
#

# Set folder paths
pngFolder="$PWD/../png/all/*"
svgFolder="$PWD/../svg"
icoFolder="$PWD/../ico"
archiveFolder="$PWD"

rm -rf semicon
mkdir semicon
mkdir semicon/png
mkdir semicon/ico

cp ../LICENSE.md semicon
cp -R $pngFolder semicon/png/
cp -R $svgFolder semicon
cp -R $icoFolder semicon

# 7z archive
rm -f semicon.7z
7z a -mx=9 semicon.7z semicon
mv semicon.7z $PWD/../downloads/

# Clean up and remove png and ico folders
rm -rf semicon
rm -rf $PWD/../png
rm -rf $PWD/../ico
