/*EXAMPLE 12.6*/

data football;
infile 'T8_3_FOOTBALL.dat';
input group wdim circum fbeye eyehd earhd jaw;
   if group=3 then group=2;
   if group=1 then delete;

proc princomp cov out=results plots(ncomp = 2)=score(ellipse);
  var wdim circum fbeye eyehd earhd jaw;
run;

proc print data = results;
var prin1 prin2;
RUN;
