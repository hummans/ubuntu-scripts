#!/bin/sh
# XMP tags editor extension

# test Ubuntu distribution
DISTRO=$(lsb_release -is 2>/dev/null)
[ "${DISTRO}" != "Ubuntu" ] && { zenity --error --text="This automatic installation script is for Ubuntu only"; exit 1; }

# install tools
sudo apt-get -y install exiftool iconv imagemagick zenity

# install main script
sudo wget -O /usr/local/bin/xmp-tagger https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/pdf/xmp-tagger
sudo chmod +x /usr/local/bin/xmp-tagger

# desktop integration
sudo wget -O /usr/share/applications/xmp-tagger.desktop https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/pdf/xmp-tagger.desktop
mkdir --parents $HOME/.local/share/file-manager/actions
wget -O $HOME/.local/share/file-manager/actions/xmp-tagger-action.desktop https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/pdf/xmp-tagger-action.desktop