data crime;
   infile 'T14_1_CITYCRIME.dat' delimiter='09'x;
   input City $ Murder Rape Robbery Assault Burglary Larceny AutoTheft;
run;

proc cluster data=crime outtree=treecrime method=average nonorm;
   var Murder Rape Robbery Assault Burglary Larceny AutoTheft;
   id city;
run;

proc tree data=treecrime;
id city;
run;

