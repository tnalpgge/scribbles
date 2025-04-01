SRC=16tons.gv
OBJ=${SRC:R}.png ${SRC:R}.svg
DOT=dot
RM=rm

all: ${OBJ}

.SUFFIXES: .gv .png .svg

.gv.svg:
	${DOT} -T${.TARGET:E} -o${.TARGET} ${.IMPSRC}

.gv.png:
	${DOT} -T${.TARGET:E} -o${.TARGET} ${.IMPSRC}

clean:
	-${RM} -f ${OBJ}
