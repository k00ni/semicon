#
# UPDATE README
#

# Reset readme
rm ../README.md
echo "# Semicon \n" > ../README.md

# Set folder paths
pngFolder="$PWD/../png/all"

whitespacePath="![](https://raw.github.com/k00ni/semicon/master/misc/images/whitespace.png)"
filePath="![](https://raw.github.com/k00ni/semicon/master/png/all/"

# first convert svg's to png
for i in `find $pngFolder -depth -name '*.png'`; do 
    filename=$(basename "$i") extension="${filename##*.}" filename="${filename%.*}"
    echo "$filePath$filename.png) $whitespacePath " >> ../README.md;
done

echo "\n
Semicon is a collection of icons (called semicons) for the [Semantic Web](http://en.wikipedia.org/wiki/Semantic_Web).
There are semicons for a various topics, e.g. file or structure related ones.

## Getting started

Simply download it the complete icon set as [zip](https://github.com/k00ni/semicon/raw/master/downloads/semicon.zip) 
or [tar gz](https://github.com/k00ni/semicon/raw/master/downloads/semicon.tar.gz). 
Extract downloaded archive into your images folder and enjoy!

## License
Semicon is licensed under the terms of 
[Creative Commons \"CC BY-SA\" 3.0](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US), 
which includes usage for commercial projects too." >> ../README.md
