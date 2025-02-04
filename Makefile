 SPHINXOPTS    ?=
 SPHINXBUILD   ?= sphinx-build

PATH_HERE   		= $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH_SOURCE 		= source
PATH_SOURCE_STATIC  = source/_static/
PATH_GROWBIES 		= source/_static/growbies/
PATH_GROWBIES_IDX   = source/_static/growbies/index.html
PATH_BUILD          = build/
PATH_GROWBIES_DOCS  = growbies/docs/

 default: html

 builddir:
	( \
		mkdir -p ${PATH_BUILD}; \
	)

 clean:
	( \
 	    rm -rf ${PATH_BUILD}*; \
 	    rm -rf ${PATH_GROWBIES}/*; \
 	    cd $(PATH_GROWBIES_DOCS) > /dev/null; \
 	    make clean; \
 	)

 html: builddir $(PATH_GROWBIES_IDX)
	( \
 		$(SPHINXBUILD) -b html $(PATH_SOURCE) $(PATH_BUILD) $(SPHINXOPTS) $(O); \
 	)


$(PATH_GROWBIES_IDX):
	( \
         cd $(PATH_GROWBIES_DOCS); \
         make; \
         cd $(PATH_HERE); \
         mkdir -p $(PATH_GROWBIES); \
         cp -r $(PATH_GROWBIES_DOCS)build/* $(PATH_GROWBIES); \
     )

