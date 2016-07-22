include meta.make

###############################################################################

all: $(FILE_BASE_NAME).html $(FILE_BASE_NAME).pdf

.PHONY : all html pdf odt pdf-latex slides jdhp publish clean init

SRCFILES=Makefile main.rst content/*.rst

## ARTICLE ####################################################################

# HTML ############

html: $(FILE_BASE_NAME).html

$(FILE_BASE_NAME).html: $(SRCFILES)
	rst2html --title=$(TITLE) --date --time --generator \
		--language=$(LANGUAGE) --tab-width=4 --math-output=$(MATH_OUTPUT) \
		--source-url=$(SOURCE_URL) --stylesheet=$(HTML_STYLESHEET) \
		--section-numbering --embed-stylesheet --strip-comments \
		main.rst $@

# PDF #############

pdf: $(FILE_BASE_NAME).pdf

$(FILE_BASE_NAME).pdf: $(SRCFILES)
	rst2pdf --language=$(LANGUAGE) --repeat-table-rows -o $@ main.rst

# ODT #############

odt: $(FILE_BASE_NAME).odt

$(FILE_BASE_NAME).odt: $(SRCFILES)
	rst2odt main.rst $@

# PDF Latex #######

pdf-latex: $(FILE_BASE_NAME).latex.pdf

$(FILE_BASE_NAME).latex.pdf: $(SRCFILES)
	#pandoc --toc -N  -V papersize:"a4paper" -V geometry:"top=2cm, bottom=3cm, left=2cm, right=2cm" -V "fontsize:12pt" -o $@ main.rst
	pandoc --toc -N  -V papersize:"a4paper" -V "fontsize:12pt" -o $@ main.rst

## SLIDES #####################################################################

slides: $(FILE_BASE_NAME)_slides.html

$(FILE_BASE_NAME)_slides.html: $(SRCFILES)
	rst2s5 --title=$(TITLE) --date --time --generator \
		--language=$(LANGUAGE) --tab-width=4 --math-output=$(MATH_OUTPUT) \
		--source-url=$(SOURCE_URL) \
		main.rst $@

## JDHP #######################################################################

publish: jdhp

jdhp:$(FILE_BASE_NAME).pdf $(FILE_BASE_NAME).html
	# JDHP_DOCS_URI is a shell environment variable that contains the
	# destination URI of the HTML files.
	@if test -z $$JDHP_DOCS_URI ; then exit 1 ; fi

	# Copy HTML
	@rm -rf $(HTML_TMP_DIR)/
	@mkdir $(HTML_TMP_DIR)/
	cp -v $(FILE_BASE_NAME).html $(HTML_TMP_DIR)/
	cp -vr images $(HTML_TMP_DIR)/

	# Upload the HTML files
	rsync -r -v -e ssh $(HTML_TMP_DIR)/ ${JDHP_DOCS_URI}/$(FILE_BASE_NAME)/
	
	# JDHP_DL_URI is a shell environment variable that contains the destination
	# URI of the PDF files.
	@if test -z $$JDHP_DL_URI ; then exit 1 ; fi
	
	# Upload the PDF file
	rsync -v -e ssh $(FILE_BASE_NAME).pdf ${JDHP_DL_URI}/pdf/

## CLEAN ######################################################################

clean:
	@echo "Remove compilation files"
	@rm -rvf ui/

init: clean
	@echo "Remove target files"
	@rm -vf $(FILE_BASE_NAME).html
	@rm -vf $(FILE_BASE_NAME).pdf
	@rm -vf $(FILE_BASE_NAME).latex.pdf
	@rm -vf $(FILE_BASE_NAME).odt
	@rm -vf $(FILE_BASE_NAME).latex
	@rm -vf $(FILE_BASE_NAME)_slides.html
	@rm -rf $(HTML_TMP_DIR)/

