.PHONY: clean build

cleiton-loiola.pdf: resume.ms res.tmac pdf/a4.tmac
	@groff 			\
		-Kutf8 		\
		-ms 		\
		-M ./pdf 	\
		-M . 		\
		-mres 		\
		-ma4 		\
		-Tpdf 		\
		-P-pA4 		\
		resume.ms > cleiton-loiola.pdf

build: cleiton-loiola.pdf

clean:
	rm -f cleiton-loiola.pdf