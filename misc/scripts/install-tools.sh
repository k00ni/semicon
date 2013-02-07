# Try and install a usable conversion utility
# What and how we try and install may depend on
# the environment

# Check whether the user already has a usable utility
which rsvg-convert >> /dev/null
if [ $? -eq 0 ]; then
  echo "rsvg-convert available in your environment"
  exit 0
fi
which convert >> /dev/null
if [ $? -eq 0 ]; then
  echo "convert available in your environment"
  exit 0
fi

# No usable utility
# Try and install rsvg-convert

# Try apt-get
which apt-get >> /dev/null
if [ $? -eq 0 ]; then
  # We have apt-get available
  echo "Trying to use apt-get to install"
  sudo apt-get install librsvg2-bin
  exit 0
fi

# TODO: Try yum
# Need to know what the package name would be

# Try homebrew
which brew >> /dev/null
if [ $? -eq 0 ]; then
  # We have homebrew available
  echo "Trying to use homebrew to install"
  brew install rsvg-convert
  exit 0
fi

# Try macports
which port >> /dev/null
if [ $? -eq 0 ]; then
  # We have macports available
  echo "Trying to use macports to install"
  sudo port install librsvg
  exit 0
fi

echo "No suitable installation utility available on your system"
