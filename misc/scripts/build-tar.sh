#
# BUILD ARCHIVES
#

# Set folder paths
pngFolder="$PWD/../png/all/*"
svgFolder="$PWD/../svg"
archiveFolder="$PWD"

rm -rf semicon
mkdir semicon
mkdir semicon/png
cp ../LICENSE.md semicon
cp -R $pngFolder semicon/png/
cp -R $svgFolder semicon

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
