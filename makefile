codificacion.pdf: codificacion.lhs
	pandoc --to latex --from markdown+lhs $< -o $@
