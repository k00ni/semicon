#
# UPDATE README
# 
# Create an overview about all the icons grouped by sections.
#

# Add icon path to README.md
# 
# Parameter list:
#   $1 - pngFolder to go through and use 
#   $2 - filePath part
putImageToReadme() {
    pngFolder=$1
    filePath=$2

    whitespacePath="![](../../raw/master/misc/images/whitespace.png)"

    # Find and link the PNGs
    for i in `find $pngFolder -depth -name '*.png'`; do 
        filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
        echo "$filePath$filename.png) $whitespacePath " >> ../README.md;
    done
}

#
# Reset readme
#
rm ../README.md
cat "$PWD/scripts/readme-title.md" > ../README.md

#
# Add icons to README.md grouped by the topic
#
size=32

echo "\n\n### Action \n" >> ../README.md
putImageToReadme "$PWD/../png/action/$size" "![](../../raw/master/png/action/$size/"

echo "\n\n### Data Cube Vocabulary \n" >> ../README.md
putImageToReadme "$PWD/../png/datacube/$size" "![](../../raw/master/png/datacube/$size/"

echo "\n\n### File \n" >> ../README.md
putImageToReadme "$PWD/../png/file/$size" "![](../../raw/master/png/file/$size/"

echo "\n\n### Structure \n" >> ../README.md
putImageToReadme "$PWD/../png/structure/$size" "![](../../raw/master/png/structure/$size/"

echo "\n\n### Terms \n" >> ../README.md
putImageToReadme "$PWD/../png/terms/$size" "![](../../raw/master/png/terms/$size/"

echo "\n\n### Triple Store \n" >> ../README.md
putImageToReadme "$PWD/../png/triplestore/$size" "![](../../raw/master/png/triplestore/$size/"

#
# Add general description about the project itself.
#
cat "$PWD/scripts/readme-main.md" >> ../README.md
