export APP_VERSION := 3.6.0_blue_mod

.PHONY: clean all nx romfs

all: nx

romfs:
    @mkdir -p romfs

romfs/assets.zip : romfs assets
    @rm -f romfs/assets.zip
    @zip -rj romfs/assets.zip assets

nx: romfs/assets.zip
    $(MAKE) -f Makefile.nx

clean:
    @rm -Rf romfs
    $(MAKE) -f Makefile.nx clean
