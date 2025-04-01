SRC=16tons.gv
OBJ=$(SRC:.gv=.png) $(SRC:.gv=.svg)
DOT=dot

all: $(OBJ)

%.svg: %.gv
	$(DOT) -T$(subst .,,$(suffix $@)) -o$@ $<

%.png: %.gv
	$(DOT) -T$(subst .,,$(suffix $@)) -o$@ $<

clean:
	-${RM} -f $(OBJ)
