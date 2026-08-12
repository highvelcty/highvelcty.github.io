SPHINXOPTS  ?=
SPHINXBUILD ?= sphinx-build

PATH_SOURCE = source
PATH_BUILD  = build

default: html

clean:
	rm -rf $(PATH_BUILD)

html:
	$(SPHINXBUILD) -b html $(PATH_SOURCE) $(PATH_BUILD) $(SPHINXOPTS) $(O)