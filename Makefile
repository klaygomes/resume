.PHONY: clean build
OUTPUT = cleiton-loiola

build: $(OUTPUT) $(OUTPUT).pdf

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

clean:
	rm -f $(OUTPUT) $(OUTPUT).pdf
