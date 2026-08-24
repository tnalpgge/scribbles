GS=gs
GSFLAGS=-dBATCH -dNOPAUSE -dNOSAFER -dQUIET -sDEVICE=pngalpha
HERD=agendercow arocow arocow1 arocow2 bullgay5 bullgay7 cowabro cowace cowaceflux cowbi cowbigender cowdemiboy cowdemigirl cowgay cowgay7 cowgay8 cowgay9 cowgrayace cowintergender cowlesbian5 cowlesbian7 cowlesbianpink cowmaverique demiagendercow enbycow enbycowlatte genderapatheticow genderfluidcow genderfluxcow genderqueercow gendervoidcow grayrocow neutroiscow omnicow pancow pangendercow polycow transbull transcow
SRCS=${HERD:S/$/.ps/}
OBJS=${SRCS:S/.ps$/.png/}
RM=rm -f
GM=gm

all: ${OBJS}

.SUFFIXES: .ps .png

.ps.png:
	${GS} ${GSFLAGS} -sOutputFile=${.TARGET} ${.IMPSRC}
	-${GM} mogrify -comment https://creativecommons.org/licenses/by-nc-sa/4.0/ ${.TARGET}

clean:
	-${RM} *.png
