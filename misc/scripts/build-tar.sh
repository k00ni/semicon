#
# BUILD ARCHIVES
#

# Set folder paths
pngFolder="$PWD/../png/all/*"
svgFolder="$PWD/../svg"
icoFolder="$PWD/../ico/"
archiveFolder="$PWD"

rm -rf semicon
mkdir semicon
mkdir semicon/png
mkdir semicon/ico

cp ../LICENSE.md semicon
cp -R $pngFolder semicon/png/
cp -R $svgFolder semicon
cp -R $icoFolder semicon/ico/

# Tar archive
rm -f semicon.tar.gz
tar -czf semicon.tar.gz semicon
mv semicon.tar.gz $PWD/../downloads/

# Zip archive
rm -f semicon.zip
zip -r semicon semicon
mv semicon.zip $PWD/../downloads/

# Clean
rm -rf semicon
