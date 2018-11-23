#
# UPDATE README
#
# Create an overview about all the icons grouped by sections.
#

# Add icon path to README.md
#
# Parameter list:
#   $1 - imageFolder to go through and use
#   $2 - filePath part
putImageToReadme() {
    imageFolder=$1
    filePath=$2

    whitespacePath="![](https://rawgithub.com/k00ni/semicon/master/misc/images/whitespace.png)"

    # Find and link the PNGs
    for i in `find $imageFolder -depth -name '*.svg'`; do
        filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
        echo "$filePath$filename.svg) $whitespacePath " >> README.md;
    done
}

#
# Reset readme
#
rm README.md
cat "$PWD/misc/scripts/readme-head.md" > README.md

#
# Add icons to README.md
#
putImageToReadme "$PWD/icons/svg/$size" "![](https://rawgithub.com/k00ni/semicon/master/icons/svg/"
