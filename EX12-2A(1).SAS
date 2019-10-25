/*EXAMPLE 12.2(a)*/

data sons;
infile 'T3_7_SONS.dat';
input x1 x2 y1 y2;

proc princomp cov;
  var x1 x2;
run;

