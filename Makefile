.PHONY: clean build
OUTPUT = cleiton-loiola
ESC := $(shell printf '\033')

build: $(OUTPUT) $(OUTPUT).pdf $(OUTPUT).md

# Create PDF File
$(OUTPUT).pdf: resume.ms a4.tmac
	@groff 			\
		-Kutf8 		\
		-ms 		\
		-M .	 	\
		-ma4 		\
		-Tpdf 		\
		-P-pA4 		\
		resume.ms > $(OUTPUT).pdf

# Create Terminal UTF-8 Text File
$(OUTPUT): resume.ms as.tmac
	@groff 			\
		-Kutf8 		\
		-M .	 	\
		-mas 		\
		-ms			\
		-Tutf8		\
		-P-f		\
		resume.ms > $(OUTPUT)

# Create Markdown File
$(OUTPUT).md: resume.ms md.tmac
	@groff 			\
		-Kutf8 		\
		-M .	 	\
		-mmd 		\
		-ms			\
		-Tutf8		\
		resume.ms	\
	| sed			\
		-e 's/ $(ESC)\[22m/$(ESC)[22m /g' \
		-e 's/$(ESC)\[1m/**/g'	\
		-e 's/$(ESC)\[22m/**/g'	\
		-e 's/‐/-/g'		\
		> $(OUTPUT).md

pdf: $(OUTPUT).pdf
txt: $(OUTPUT)
md: $(OUTPUT).md

clean:
	rm -f $(OUTPUT) $(OUTPUT).pdf $(OUTPUT).md
