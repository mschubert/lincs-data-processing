LXB = $(shell cat raw_accessions.txt)
FILES = $(LXB:%=%_RAW.tar.gz)

all: $(FILES)

# Use `print-VARNAME` to print arbitrary variables
print-%: ; @echo $* = $($*)

%_RAW.tar.gz:
	wget -N https://www.ncbi.nlm.nih.gov/geo/download/?acc=$*&format=file -O $@
