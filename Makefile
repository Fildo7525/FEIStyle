FILE = main
BUILD_DIR = .build

LATEXMK_OPTIONS = -pdf -synctex=1 -output-directory=$(BUILD_DIR) -interaction=nonstopmode -enable-write18
# -silent
# -f
LINE_WIDTH = error_line=240 half_error_line=160 max_print_line=240

all: pdf

pdf:
	$(LINE_WIDTH) latexmk $(LATEXMK_OPTIONS) $(FILE).tex
	mv $(BUILD_DIR)/$(FILE).pdf .

clean:
	rm -rf $(BUILD_DIR)
	rm -fr $(FILE).pdf

refresh: clean pdf

.PHONY: all pdf clean refresh
