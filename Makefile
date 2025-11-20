# Makefile for HIDE IEEE Access Paper
# Author: Fabricio Rodrigues Freire

# Main target
TARGET = access
BIBTEX_FILE = references

# LaTeX and BibTeX commands
LATEX = pdflatex
BIBTEX = bibtex
VIEWER = evince

# Source files
TEX_FILES = $(TARGET).tex
BIB_FILES = $(BIBTEX_FILE).bib
PDF_FILE = $(TARGET).pdf

# Build flags
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

.PHONY: all clean view help

# Default target
all: $(PDF_FILE)

# Main compilation rule
$(PDF_FILE): $(TEX_FILES) $(BIB_FILES)
	@echo "Compiling LaTeX document..."
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	@echo "Running BibTeX..."
	$(BIBTEX) $(TARGET)
	@echo "Recompiling with bibliography..."
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	@echo "Final compilation..."
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex
	@echo "Compilation complete: $(PDF_FILE)"

# Quick compilation (without bibliography)
quick: $(TEX_FILES)
	@echo "Quick compilation..."
	$(LATEX) $(LATEX_FLAGS) $(TARGET).tex

# View the generated PDF
view: $(PDF_FILE)
	@echo "Opening PDF viewer..."
	$(VIEWER) $(PDF_FILE) &

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

# Clean everything including PDF
distclean: clean
	@echo "Removing PDF file..."
	rm -f $(PDF_FILE)

# Check for required files
check:
	@echo "Checking required files..."
	@test -f $(TARGET).tex || (echo "Error: $(TARGET).tex not found" && exit 1)
	@test -f $(BIBTEX_FILE).bib || (echo "Error: $(BIBTEX_FILE).bib not found" && exit 1)
	@test -f ieeeaccess.cls || (echo "Error: ieeeaccess.cls not found" && exit 1)
	@echo "All required files found."

# Count words in the document
wordcount:
	@echo "Counting words in $(TARGET).tex..."
	@texcount -brief $(TARGET).tex

# Spell check (requires aspell)
spellcheck:
	@echo "Running spell check..."
	@aspell check $(TARGET).tex

# Help target
help:
	@echo "Available targets:"
	@echo "  all        - Compile the full document with bibliography"
	@echo "  quick      - Quick compilation without bibliography"
	@echo "  view       - Open the PDF with default viewer"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files including PDF"
	@echo "  check      - Check for required files"
	@echo "  wordcount  - Count words in the document"
	@echo "  spellcheck - Run spell checker (requires aspell)"
	@echo "  help       - Show this help message"

# Archive target for submission
archive: $(PDF_FILE)
	@echo "Creating submission archive..."
	tar -czf hide_submission_$(shell date +%Y%m%d).tar.gz \
		$(TARGET).tex $(BIBTEX_FILE).bib ieeeaccess.cls \
		*.png $(PDF_FILE) README.md
	@echo "Archive created: hide_submission_$(shell date +%Y%m%d).tar.gz"
