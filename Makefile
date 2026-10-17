.PHONY: clean build pdf txt md cover
OUTPUT = cleiton-loiola
COVER = $(OUTPUT)-cover-letter
ESC := $(shell printf '\033')
GROFF = groff -Kutf8 -M .
SHARED = profile.ms common.tmac

build: $(OUTPUT) $(OUTPUT).pdf $(OUTPUT).md

# Create PDF Files
$(COVER).pdf: cover-letter.ms a4.tmac $(SHARED)
	@$(GROFF) -ms -ma4 -Tpdf -P-pA4 $< > $@

$(OUTPUT).pdf: resume.ms a4.tmac $(SHARED)
	@$(GROFF) -ms -ma4 -Tpdf -P-pA4 $< > $@

# Create Terminal UTF-8 Text File
$(OUTPUT): resume.ms as.tmac $(SHARED)
	@$(GROFF) -mas -ms -Tutf8 -P-f $< > $@

# Create Markdown File
$(OUTPUT).md: resume.ms md.tmac $(SHARED)
	@$(GROFF) -mmd -ms -Tutf8 $<	\
	| sed				\
		-e 's/ $(ESC)\[22m/$(ESC)[22m /g' \
		-e 's/$(ESC)\[1m/**/g'	\
		-e 's/$(ESC)\[22m/**/g'	\
		-e 's/‐/-/g'		\
		> $@

pdf: $(OUTPUT).pdf
txt: $(OUTPUT)
md: $(OUTPUT).md
cover: $(COVER).pdf

clean:
	rm -f $(OUTPUT) $(OUTPUT).pdf $(OUTPUT).md $(COVER).pdf
