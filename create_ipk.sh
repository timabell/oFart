#!/bin/sh

release=$1
if [ -z "$release" ]; then
	echo "version required"
	exit 1
fi


# Create dirs
mkdir -p opkgfolder/usr/bin
mkdir -p opkgfolder/usr/share/applications/
mkdir -p opkgfolder/usr/share/ofart/sounds/
mkdir -p opkgfolder/usr/share/ofart/pixmaps/
mkdir -p opkgfolder/usr/share/pixmaps/

# Copy the script
cp ofart opkgfolder/usr/bin/

#copy glade ui
cp ofart.glade opkgfolder/usr/share/ofart/

# Copy .desktop
cp oFart.desktop opkgfolder/usr/share/applications/
cp oFart.png opkgfolder/usr/share/pixmaps/

# Copy sounds
cp squeek.wav opkgfolder/usr/share/ofart/sounds/

# Copy images
cp whoopey.png opkgfolder/usr/share/ofart/pixmaps/

# Copy control
mkdir opkgfolder/CONTROL
cp control opkgfolder/CONTROL

#add version info
echo "Version: $release" >> opkgfolder/CONTROL/control

fakeroot ./ipkg-build opkgfolder

md5sum ofart_${release}_armv4t.ipk > ofart_${release}_armv4t.ipk.md5

# Clean
rm -rf opkgfolder
