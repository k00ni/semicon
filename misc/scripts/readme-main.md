## Getting started

You can choose between the SVG or PNG version of the icons. SVG icons are scale free, which means you can choose the size you want, and it will works.

### PNGs

Pre-generated PNG icons are available in sizes 16x16, 32x32, 48x48, 64x64, 128x128 and 256x256.  You can generate PNGs in different sizes using the provided script e.g.

    > ./scripts/build-pngs.sh X

Replace `X` with the desired size, this script should be run from the `misc` directory of your local clone

### ICO

Pre-generated ICO files are provided, these include the icons in each of the PNG sizes.  ICOs are generated from the PNGs so if you want a different range of sizes you can regenerate these yourself using the provided script e.g.

    > ./scripts/build-icos.sh

This builds ICO files based on the folders currently in your PNG folders, to add/remove sizes either generate PNGs in the desired sizes or delete the undesired sizes.

### Downloads

Simply download it the complete icon set as [zip](../../raw/master/downloads/semicon.zip) 
or [tar gz](../../raw/master/downloads/semicon.tar.gz). The download includes the SVGs, PNGs and ICOs.

Extract downloaded archive into your images folder and enjoy!


## License

Semicon is licensed under the terms of 
[Creative Commons "CC BY-SA" 3.0](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US), which includes usage for commercial projects too.
