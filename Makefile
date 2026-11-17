SPHINXOPTS ?=
SPHINXBUILD ?= sphinx-build

PATH_BUILD = build

default: multihtml

.PHONY: default clean multihtml

clean:
	rm -rf $(PATH_BUILD)

multihtml:
	$(MAKE) -C growbies/docs multihtml \
		BUILDDIR="$(abspath $(PATH_BUILD))/" \
		SPHINXOPTS="$(SPHINXOPTS)" \
		SPHINXBUILD="$(SPHINXBUILD)" \
		O="$(O)"

