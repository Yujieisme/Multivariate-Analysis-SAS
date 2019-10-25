data crime;
   infile 'T14_1_CITYCRIME.dat' delimiter='09'x;
   input City $ Murder Rape Robbery Assault Burglary Larceny AutoTheft;
run;

proc cluster data=crime outtree=treecrime  method=complete nonorm;
   var Murder Rape Robbery Assault Burglary Larceny AutoTheft;
   id city;
run;

proc tree data=treecrime;
id city;
run;

proc iml;  /* DISTANCE MATRIX CODE */
   use crime;
   read all var{murder rape robbery assault burglary larceny autotheft} into x;
   nrow=nrow(x);
   xxp=x*x`;
   vdiag=vecdiag(xxp);
   xi=j(1,nrow)@vdiag;
   dist=sqrt(xi`-2*xxp+xi);
   distance=round(dist,0.001);
   print distance;
quit;
