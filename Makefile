SPHINXOPTS ?=
SPHINXBUILD ?= sphinx-build

PATH_SOURCE = growbies/docs/source
PATH_BUILD  = build

default: html

.PHONY: default clean html multihtml

clean:
	rm -rf $(PATH_BUILD)

html:
	$(MAKE) -C growbies/docs html \
		BUILDDIR="$(abspath $(PATH_BUILD))/" \
		DOCSDIR="$(abspath $(PATH_BUILD))/docs/" \
		SPHINXOPTS="$(SPHINXOPTS)" \
		SPHINXBUILD="$(SPHINXBUILD)" \
		O="$(O)"

multihtml:
	$(MAKE) -C growbies/docs multihtml \
		BUILDDIR="$(abspath $(PATH_BUILD))/" \
		DOCSDIR="$(abspath $(PATH_BUILD))/docs/" \
		SPHINXOPTS="$(SPHINXOPTS)" \
		SPHINXBUILD="$(SPHINXBUILD)" \
		O="$(O)"