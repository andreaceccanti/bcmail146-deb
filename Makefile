# needed dirs
debbuild_dir=$(shell pwd)/debbuild


all: deb


clean: 
	rm -rf $(debbuild_dir)

deb: clean
	mkdir -p $(debbuild_dir)
	cp sources/bouncycastle_1.46+dfsg.orig.tar.gz $(debbuild_dir)
	tar -C $(debbuild_dir) -xvzf sources/bouncycastle_1.46+dfsg.orig.tar.gz
	cp -r sources/debian $(debbuild_dir)/bouncycastle-1.46.orig
	cd $(debbuild_dir)/bouncycastle-1.46.orig && debuild -us -uc
