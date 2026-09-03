GS=gs
GSFLAGS=-dBATCH -dNOPAUSE -dNOSAFER -dQUIET -sDEVICE=pngalpha
HERD=agendercow arocow arocow1 arocow2 bullgay5 bullgay7 cowabro cowace cowaceflux cowbi cowbigender cowdemiboy cowdemigirl cowgay cowgay7 cowgay8 cowgay9 cowgayflag cowgrayace cowintergender cowlesbian5 cowlesbian7 cowlesbianpink cowmaverique demiagendercow demiromanticow demisexualcow emojicowgay enbycow enbycowlatte genderapatheticow genderfluidcow genderfluxcow genderqueercow gendervoidcow grayrocow intersexinclusivecow neutroiscow omnicow pancow pangendercow polycow quasarprogresscow transbull transcow
SRCS=${HERD:S/$/.ps/}
OBJS=${SRCS:S/.ps$/.png/}
DIGESTED=${OBJS:S/.png$/.digested/}
DIGESTIBLE=${OBJS:S/.png$/.digestible/}
RM=rm -f
GM=gm
DIGESTER=./digest.pl
VERIFIER=./digestible.pl
TOUCH=touch

all: ${OBJS}

digested: ${DIGESTED}

digestible: ${DIGESTIBLE}

verify: digested digestible

.SUFFIXES: .ps .png .digested .digestible

.ps.png:
	${GS} ${GSFLAGS} -sOutputFile=${.TARGET} ${.IMPSRC}
	-${GM} mogrify -comment https://creativecommons.org/licenses/by-nc-sa/4.0/ ${.TARGET}

.png.digested: 
	${DIGESTER} ${.IMPSRC}
	${TOUCH} ${.TARGET}

.png.digestible:
	${VERIFIER} ${.IMPSRC}
	${TOUCH} ${.TARGET}

clean:
	-${RM} *.png
	-${RM} *.digested
	-${RM} *.digestible

${OBJS}: cowsaypride.ps
