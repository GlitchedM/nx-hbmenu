export APP_VERSION	:=	Blue Edition

.PHONY: clean all nx pc dist-bin

all: nx pc

romfs:
	@mkdir -p romfs

romfs/assets.zip	:	romfs assets
	@rm -f romfs/assets.zip
	@zip -rj romfs/assets.zip assets

dist-bin:	romfs/assets.zip
	$(MAKE) -f Makefile.nx dist-bin

nx:	romfs/assets.zip
	$(MAKE) -f Makefile.nx

pc:	romfs/assets.zip
	$(MAKE) -f Makefile.pc

clean:
	@rm -Rf romfs
	$(MAKE) -f Makefile.pc clean
	$(MAKE) -f Makefile.nx clean
