GS=gs
GSFLAGS=-dBATCH -dNOPAUSE -dNOSAFER -dQUIET -sDEVICE=pngalpha
HERD=agendercow arocow arocow1 arocow2 bullgay5 bullgay7 cowabro cowace cowaceflux cowbi cowbigender cowdemiboy cowdemigirl cowgay cowgay7 cowgay8 cowgay9 cowgayflag cowgrayace cowintergender cowlesbian5 cowlesbian7 cowlesbianpink cowmaverique demiagendercow demiromanticow demisexualcow emojicowgay enbycow enbycowlatte genderapatheticow genderfluidcow genderfluxcow genderqueercow gendervoidcow grayrocow intersexinclusivecow neutroiscow omnicow pancow pangendercow polycow quasarprogresscow transbull transcow
STAMPEDE=cowgayanimated
SRCS=${HERD:S/$/.ps/} ${STAMPEDE:S/$/.ps/}
OBJS=${HERD:S/$/.png/} ${STAMPEDE:S/$/.gif/}
DIGESTED=${HERD:S/$/.digested/}
DIGESTIBLE=${HERD:S/$/.digestible/}
RM=rm -f
GM=gm
DIGESTER=./digest.pl
VERIFIER=./digestible.pl
TOUCH=touch

all: ${OBJS}

digested: ${DIGESTED}

digestible: ${DIGESTIBLE}

verify: digested digestible

.SUFFIXES: .ps .png .digested .digestible .gif

.ps.png:
	${GS} ${GSFLAGS} -sOutputFile=${.TARGET} ${.IMPSRC}
	-${GM} mogrify -comment https://creativecommons.org/licenses/by-nc-sa/4.0/ ${.TARGET}

.ps.gif:
	${GS} ${GSFLAGS} -sOutputFile=${.TARGET:R}%02d.png ${.IMPSRC}
	${GM} convert -delay 36 -colors 256 -dispose previous -loop 0 ${.TARGET:R}*.png ${.TARGET}

.png.digested: 
	${DIGESTER} ${.IMPSRC}
	${TOUCH} ${.TARGET}

.png.digestible:
	${VERIFIER} ${.IMPSRC}
	${TOUCH} ${.TARGET}

clean:
	-${RM} *.png
	-${RM} *.gif
	-${RM} *.digested
	-${RM} *.digestible

${OBJS}: cowsaypride.ps
