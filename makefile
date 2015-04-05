codificacion.pdf: codificacion.lhs
	pandoc --to pdf --from markdown+lhs $< -o $@
