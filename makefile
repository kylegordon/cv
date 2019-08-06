all: 	ps dvi pdf html

ps: 	dvi
	## Make the PS file
	dvips output/cv.dvi -o output/cv.ps

dvi:
	latex -halt-on-error -output-directory=output/ cv.tex

pdf:
	pdflatex -aux-directory=aux -output-directory=output cv.tex

html:
	latex2html -local_icons -no_subdir -dir=output cv.tex

upload:
	scp *.* bagpuss@lodge.glasgownet.com:www/sites/lodge.glasgownet.com/cv_files/
	scp output/* bagpuss@lodge.glasgownet.com:www/sites/lodge.glasgownet.com/cv_files/

clean:
	rm -vrf output
