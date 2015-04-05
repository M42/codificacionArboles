codificacion.tex: codificacion.lhs
	lhs2TeX codificacion.lhs -o codificacion.tex

codificacion.pdf: codificacion.tex
	pdflatex codificacion.tex -o codificacion.pdf
