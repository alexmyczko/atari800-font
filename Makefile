BDFS = $(wildcard *.bdf)
PCFS = $(BDFS:%.bdf=%.pcf)

all: pcfs

pcfs: $(PCFS)

$(PCFS): %.pcf: %.bdf
	bdftopcf -o $@ $^

sfd:
	bdf2sfd atari800-normal.bdf > atari800-normal.sfd

otf:
	fontforge -lang=ff -c 'Open($$1); Generate($$2)' atari800-normal-ext.sfd AtariSmall.otf
#	fontforge -lang=ff -c 'Open($$1); Generate($$2)' atari800-normal.sfd atari800-normal.otf

clean:
	rm -f *.pcf

.PHONY: all clean
