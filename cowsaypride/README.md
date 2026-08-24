

# cowsaypride: like pride flags, but with more early internet

A collection of pride flag graphics with an ASCII art cow (or bull) head.

Why?  Because the internet brought LGBTQIA+ people together more than they had ever been.  Because it helped them find community not bound by geography.  Because some of them helped build the internet we know today.  Because I am fortunate to have met some of those pioneers.

I do not count myself among them, but I am fortunate enough to have spent time with LGBTQIA+ folk from my earliest years.  This is my very small way of saying that I see you, and I appreciate you, and I hope that wherever you are, that the people around you allow to be yourself.

Too political for you?  I'm sorry you feel that way.

I tried using SVG but placing the cow (or bull) head, with its alternate arrangement of colors, proved to be exceedingly tricky if I wanted to completely precompute the image.  Thus, PostScript it is.

[`cowsaypride.ps`](./cowsaypride.ps) is the library that all the other `*.ps` files rely upon.

To build any individual file, use Ghostscript.  e.g. for a PNG image:

    gs -dNOSAFER -dBATCH -dNOPAUSE -dQUIET -sDEVICE=pngalpha -sOutputFile=cowgay.png cowgay.ps

Use [`Makefile`](./Makefile) (BSD make) or [`GNUmakefile`](./GNUmakefile) (GNU make) to build all PNG images in one `make` or `gmake` command.  The `clean` target deletes the images.

If [GraphicsMagick](http://www.graphicsmagick.org) is available,  license information will be embedded in output images.


# License

Image source code is copyright © by the committers in whatever year they committed.

Image source code is covered by GNU General Public license version 3.  See [`LICENSE`](./LICENSE).

Output images are covered by [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

tl;dr If you try to make money off these, you suck.  In the bad way.

