all: 	ps dvi pdf html

ps: 	dvi
	## Make the PS file
	dvips cv.dvi -o cv.ps

dvi:
	latex -halt-on-error cv.tex

		
pdf:
	pdflatex cv.tex

html:
	latex2html -local_icons -no_subdir cv.tex

upload:
	scp *.* bagpuss@lodge.glasgownet.com:www/sites/lodge.glasgownet.com/cv_files/

