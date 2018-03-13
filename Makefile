BUILD_ENGINE:= xelatex
PLATFORM:=$(shell uname)
ifeq ($(PLATFORM), Linux)
	PDF_CMD:=evince
else ifeq ($(PLATFORM), Darwin)
	PDF_CMD:=open
endif

all: cv

cv: cv.tex
	$(BUILD_ENGINE) $<

display: cv.pdf
	$(PDF_CMD) $< &

clean:
	rm *.pdf *.aux *.bcf *.log *.out *.xml
