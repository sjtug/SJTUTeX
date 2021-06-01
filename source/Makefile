build: sjtuthesis.pdf

sjtuthesis.cls: sjtuthesis.dtx sjtuthesis.ins
	xetex -interaction=nonstopmode sjtuthesis.ins

sjtuthesis.pdf: sjtuthesis.cls sjtuthesis-graduate.ltx sjtuthesis-undergraduate.ltx
	latexmk -xelatex sjtuthesis.dtx

clean:
	latexmk -C sjtuthesis.dtx
	rm -f *.cls *.ltx
