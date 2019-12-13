#!/usr/bin/env bash
# https://www.youtube.com/watch?v=EK32jo7i5LQ
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=10 -dZOOM=10 -dPOINTS=3 -g1000x1000 -sOutputFile=primespira1.png primespira.ps
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=100 -dZOOM=10 -dPOINTS=3 -g1000x1000 -sOutputFile=primespira2.png primespira.ps
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=1000 -dZOOM=1 -dPOINTS=15 -g1000x1000 -sOutputFile=primespira3.png primespira.ps
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=10000 -dZOOM=0.1 -dPOINTS=0 -g1000x1000 -sOutputFile=primespira4.png primespira.ps
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=100000 -dZOOM=0.01 -dPOINTS=0 -g1000x1000 -sOutputFile=primespira5.png primespira.ps
gs -dNOPAUSE -dBATCH -sDEVICE=png16m -dUPPERBOUND=1000000 -dZOOM=0.001 -DPOINTS=0 -g1000x1000 -sOutputFile=primespira6.png primespira.ps
