.PHONY: nbconvert help

nbconvert:
ifndef INPUT
	$(error Please specify the notebook using INPUT=your_notebook.ipynb)
endif
	@bash ./scripts/nbconvert.sh "$(INPUT)" "$(OUTPUT)"

help:
	@echo "Usage:"
	@echo "  make nbconvert INPUT=path/to/notebook.ipynb [OUTPUT=optional/output.html]"
