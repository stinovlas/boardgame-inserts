.PHONY: all clean
.DELETE_ON_ERROR:

SRCS := $(shell find $(SRC_DIRS) -name '*.scad' -and -not -name 'all.scad' -and -not -name 'aog.scad')
OBJS := $(SRCS:.scad=.stl)

all: $(OBJS)

%.stl: %.scad aog.scad
	@echo "Generating $@"
	@echo openscad --export-format binstl -o $@ $<

clean:
	rm -v *.stl
