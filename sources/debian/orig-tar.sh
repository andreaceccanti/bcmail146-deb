#!/bin/sh -e

# called by uscan with '--upstream-version' <version> <file>
DEBIAN_VERSION=$(echo $2 | sed -e 's/^\(.\)/\1./')
DIR=bouncycastle-$DEBIAN_VERSION.orig
TAR=../bouncycastle_$DEBIAN_VERSION+dfsg.orig.tar.gz

# clean up the upstream tarball
tar zxf $3
rm -f $3
mv crypto-$2 $DIR
GZIP=--best tar czf $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
	. .svn/deb-layout
	mv $3 $origDir
	echo "moved $3 to $origDir"
fi

exit 0
