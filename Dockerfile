FROM blang/latex as build_cv

RUN apt-get update
RUN apt-get install -y latex2html

COPY . /tmp/

RUN cd /tmp; make

RUN ls -l /tmp/output/

FROM build_cv as final_cv
COPY --from=build_cv /tmp/output/cv.pdf .
