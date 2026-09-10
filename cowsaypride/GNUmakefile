GS=gs
GSFLAGS=-dBATCH -dNOPAUSE -dNOSAFER -dQUIET -sDEVICE=pngalpha
HERD=agendercow arocow arocow1 arocow2 bullgay5 bullgay7 cowabro cowace cowaceflux cowbi cowbigender cowdemiboy cowdemigirl cowgay cowgay7 cowgay8 cowgay9 cowgayflag cowgrayace cowintergender cowlesbian5 cowlesbian7 cowlesbianpink cowmaverique demiagendercow demiromanticow demisexualcow emojicowgay enbycow enbycowlatte genderapatheticow genderfluidcow genderfluxcow genderqueercow gendervoidcow grayrocow intersexinclusivecow neutroiscow omnicow pancow pangendercow polycow quasarprogresscow transbull transcow
STAMPEDE=cowgayanimated
SRCS=$(addsuffix .ps, $(HERD)) $(addsuffix .ps, $(STAMPEDE))
OBJS=$(addsuffix .png, $(HERD)) $(addsuffix .gif, $(STAMPEDE))
DIGESTED=$(addsuffix .digested, $(HERD))
DIGESTIBLE=$(addsuffix .digestible, $(HERD))
RM=rm -f
GM=gm
DIGESTER=./digest.pl
VERIFIER=./digestible.pl
TOUCH=touch

all: $(OBJS)

digested: $(DIGESTED)

digestible: $(DIGESTIBLE)

verify: digested digestible

.SUFFIXES: .png .ps .digested .digestible .gif

%.png: %.ps
	$(GS) $(GSFLAGS) -sOutputFile=$@ $<
	-$(GM) mogrify -comment https://creativecommons.org/licenses/by-nc-sa/4.0/ $@

%.gif: %.ps
	$(GS) $(GSFLAGS) -sOutputFile=$(basename $@)%02d.png $<
	$(GM) convert -delay 36 -colors 256 -dispose previous -loop 0 $(basename $@)*.png $@

%.digested: %.png
	$(DIGESTER) $<
	$(TOUCH) $@

%.digestible: %.png
	$(VERIFIER) $<
	$(TOUCH) $@

.PHONY: clean

clean:
	-$(RM) *.png
	-$(RM) *.gif
	-$(RM) *.digested
	-$(RM) *.digestible


$(OBJS): cowsaypride.ps
