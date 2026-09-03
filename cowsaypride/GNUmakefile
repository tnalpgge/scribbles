GS=gs
GSFLAGS=-dBATCH -dNOPAUSE -dNOSAFER -dQUIET -sDEVICE=pngalpha
HERD=agendercow arocow arocow1 arocow2 bullgay5 bullgay7 cowabro cowace cowaceflux cowbi cowbigender cowdemiboy cowdemigirl cowgay cowgay7 cowgay8 cowgay9 cowgayflag cowgrayace cowintergender cowlesbian5 cowlesbian7 cowlesbianpink cowmaverique demiagendercow demiromanticow demisexualcow emojicowgay enbycow enbycowlatte genderapatheticow genderfluidcow genderfluxcow genderqueercow gendervoidcow grayrocow intersexinclusivecow neutroiscow omnicow pancow pangendercow polycow quasarprogresscow transbull transcow
SRCS=$(addsuffix .ps, $(HERD))
OBJS=$(SRCS:.ps=.png)
DIGESTED=$(OBJS:.png=.digested)
DIGESTIBLE=$(OBJS:.png=.digestible)
RM=rm -f
GM=gm
DIGESTER=./digest.pl
VERIFIER=./digestible.pl
TOUCH=touch

all: $(OBJS)

digested: $(DIGESTED)

digestible: $(DIGESTIBLE)

verify: digested digestible

.SUFFIXES: .png .ps .digested .digestible

%.png: %.ps
	$(GS) $(GSFLAGS) -sOutputFile=$@ $<
	-$(GM) mogrify -comment https://creativecommons.org/licenses/by-nc-sa/4.0/ $@

%.digested: %.png
	$(DIGESTER) $<
	$(TOUCH) $@

%.digestible: %.png
	$(VERIFIER) $<
	$(TOUCH) $@

.PHONY: clean
clean:
	-$(RM) *.png
	-$(RM) *.digested
	-$(RM) *.digestible


$(OBJS): cowsaypride.ps
