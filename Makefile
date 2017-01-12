NCBI = ftp://ftp.ncbi.nlm.nih.gov/geo/series
LXB = $(shell cat raw_accessions.txt)
FILES = $(LXB:%=raw/%_RAW.tar.gz)

all: $(FILES)

# Use `print-VARNAME` to print arbitrary variables
print-%: ; @echo $* = $($*)

raw/%_RAW.tar.gz:
	@mkdir -p raw
	wget -P raw -N $(NCBI)/$(shell echo $* | sed 's/[0-9][0-9][0-9]$$/nnn/')/$*/suppl/$@
