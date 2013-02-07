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
echo "# Semicon \n" > ../README.md
echo "\nSemicon is a collection of icons (called semicons) for the 
[Semantic Web](http://en.wikipedia.org/wiki/Semantic_Web). There are semicons for 
a various topics, e.g. file or structure related ones." >> ../README.md

#
# 
#
echo "\n\n## Structure \n" >> ../README.md
putImageToReadme "$PWD/../png/structure/32" "![](../../raw/master/png/structure/32/"

echo "\n\n## Terms \n" >> ../README.md
putImageToReadme "$PWD/../png/terms/32" "![](../../raw/master/png/terms/32/"

echo "\n\n## Triple Store \n" >> ../README.md
putImageToReadme "$PWD/../png/triplestore/32" "![](../../raw/master/png/triplestore/32/"

#
# Add general description about the project itself.
#
echo "\n
## Getting started

Simply download it the complete icon set as [zip](../../raw/master/downloads/semicon.zip) 
or [tar gz](../../raw/master/downloads/semicon.tar.gz). 
Extract downloaded archive into your images folder and enjoy!


## License

Semicon is licensed under the terms of 
[Creative Commons \"CC BY-SA\" 3.0](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US), 
which includes usage for commercial projects too." >> ../README.md
