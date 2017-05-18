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
# Add icons to README.md grouped by the topic
#
echo "\n\n### Action \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/action/$size" "![](https://rawgithub.com/k00ni/semicon/master/svg/action/"

echo "\n\n### Data Cube Vocabulary \n" >> README.md
putImageToReadme "$PWD/svg/datacube/" "![](https://rawgithub.com/k00ni/semicon/master/svg/datacube/"

echo "\n\n### File \n" >> README.md
putImageToReadme "$PWD/svg/file/" "![](https://rawgithub.com/k00ni/semicon/master/svg/file/"

echo "\n\n### FOAF \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/foaf/" "![](https://rawgithub.com/k00ni/semicon/master/svg/foaf/"

echo "\n\n### Chart \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/chart/" "![](https://rawgithub.com/k00ni/semicon/master/svg/chart/"

echo "\n\n### Structure \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/structure/" "![](https://rawgithub.com/k00ni/semicon/master/svg/structure/"

echo "\n\n### Terms \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/terms/" "![](https://rawgithub.com/k00ni/semicon/master/svg/terms/"

echo "\n\n### Triple Store \n" >> $PWD/README.md
putImageToReadme "$PWD/svg/triplestore/" "![](https://rawgithub.com/k00ni/semicon/master/svg/triplestore/"
