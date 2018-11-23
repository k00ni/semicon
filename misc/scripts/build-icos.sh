#
# Build ICOs
#

echo "Generating ICOs"

set +e

which convert >> /dev/null
if [ $? -ne 0 ]; then
    echo "Error - No suitable convert utility available, install convert"
    exit 1
fi
set -e

# remove and recreate PNG dir
icodir=./icons/ico

if [ -d $icodir ]; then
    rm -r $icodir
fi

mkdir $icodir

for filename in ./icons/svg/*.svg; do
    # extract basename without extension
    filename=$(basename -- "$filename")
    filename="${filename%.*}"

    # convert SVG to PNG using inkscape
    convert ./icons/svg/$filename.svg ./icons/icp/$filename.ico
done
