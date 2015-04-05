codificacion.pdf: codificacion.tex codificacion.lhs
	pdflatex codificacion.tex -o codificacion.pdf

codificacion.tex: codificacion.lhs
	lhs2TeX codificacion.lhs -o codificacion.tex

