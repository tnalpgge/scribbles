GOAL=gvpartycowsay
DOT=dot
CONVERT=gm convert
DUMMY=dummy
LOOP=-loop 0
DELAY=-delay 10
DISPOSE=-dispose Previous
AMPLITUDE=72
SHIFT=111
FRAMES=18
BC=bc
# https://en.wikipedia.org/wiki/Triangle_wave
BCPROG=am=${AMPLITUDE};pd=${FRAMES};sh=${SHIFT};(4*am/pd)*abs(((((x-(y*pd/4))%pd)+pd)%pd)-(pd/2))+sh
#FONTNAME=dejavu sans mono bold
FONTNAME=nimbusmonops bold
FONTSIZE=36

all: ${GOAL}

${GOAL}: ${GOAL}.gif

${GOAL}.gif:
	${CONVERT} -colors 256 ${LOOP} ${DELAY} ${DISPOSE} ${.ALLSRC} ${.TARGET}

.for i in ${DUMMY:range=18}
${GOAL}.gif: ${GOAL}_${i:C/^(.)$/0\1/}.gif

${GOAL}_${i:C/^(.)$/0\1/}.gv: ${GOAL}.gv.tmpl
	r=`echo "x=${i}; y=3; ${BCPROG}" | bc`; \
	g=`echo "x=${i}; y=1; ${BCPROG}" | bc`; \
	b=`echo "x=${i}; y=2; ${BCPROG}" | bc`; \
	echo r="$${r}" g="$${g}" b="$${b}"; \
	bgcolor=`printf "#%x%x%x" "$${r}" "$${g}" "$${b}"`; \
	fgcolor=`printf "#%x%x%x" "$${g}" "$${b}" "$${r}"`; \
	sed -e "s/__bgcolor__/$${bgcolor}/g" \
	-e "s/__fgcolor__/$${fgcolor}/g" \
	-e "s/__fontname__/${FONTNAME}/g" \
	-e "s/__fontsize__/${FONTSIZE}/g" \
	"${.ALLSRC:[1]}" >"${.TARGET}"
.endfor

.SUFFIXES: .gif .gv .png

.png.gif:
	${CONVERT} -trim ${.IMPSRC} ${.TARGET}

.gv.png:
	${DOT} -Tpng -o${.TARGET} ${.IMPSRC}

clean:
	-rm -f *.png
	-rm -f *.gif
	-rm -f *.gv
