#
# Move all SVG's to svg/all and do the same for PNG's
#

copyToFolder()
{
  local src=$1
  local dest=$2
  local ext=$3

  echo "Copying $ext files from $src to $dest"

  if [ ! -e "$dest" ]; then
   mkdir -p "$dest"
  fi

  findCmd="find $src -depth -name *.$ext"
  for i in `$findCmd`; do 
    filename=$(basename "$i")
    filename="${filename%.*}"
    cp "$src/$filename.$ext" "$dest/$filename.$ext"
  done
}

copyToFolderRecursive()
{
  src=$1
  dest=$2
  ext=$3

  echo "Copying recursively from $src to $dest"

  for i in $src/*; do
    if [ -d "$i" ]; then
      dirname=$(basename "$i")
      copyToFolder "$i" "$dest/$dirname" "$ext"
    fi
  done
}

# Set folder path for SVGs
allFolder="$PWD/../svg/all"
rm -rf "$allFolder"
mkdir "$allFolder"

# Clean up existing directory contents
rm -Rf $allFolder

# Copy SVGs
copyToFolder "$PWD/../svg/action" "$allFolder" "svg"
copyToFolder "$PWD/../svg/file" "$allFolder" "svg"
copyToFolder "$PWD/../svg/structure" "$allFolder" "svg"
copyToFolder "$PWD/../svg/terms" "$allFolder" "svg"
copyToFolder "$PWD/../svg/triplestore" "$allFolder" "svg"

# Set folder paths for PNGs
allFolder="$PWD/../png/all"
rm -rf "$allFolder/*"

# Clean up existing directory contents
rm -Rf $allFolder

# Copy PNGs
copyToFolderRecursive "$PWD/../png/action" "$allFolder" "png"
copyToFolderRecursive "$PWD/../png/file" "$allFolder" "png"
copyToFolderRecursive "$PWD/../png/structure" "$allFolder" "png"
copyToFolderRecursive "$PWD/../png/terms" "$allFolder" "png"
copyToFolderRecursive "$PWD/../png/triplestore" "$allFolder" "png"

# Set folder paths for ICOs
allFolder="$PWD/../ico/all"

# Clean up existing directory contents
rm -rf $allFolder

# Copy ICOs
copyToFolder "$PWD/../ico/action" "$allFolder" "ico"
copyToFolder "$PWD/../ico/file" "$allFolder" "ico"
copyToFolder "$PWD/../ico/structure" "$allFolder" "ico"
copyToFolder "$PWD/../ico/terms" "$allFolder" "ico"
copyToFolder "$PWD/../ico/triplestore" "$allFolder" "ico"

