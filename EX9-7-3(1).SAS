/*EXAMPLE 9.7.3*/
data football;
infile 'T8_3_FOOTBALL.dat';
input group wdim circum fbeye eyehd earhd jaw;
proc discrim data=football method=npar k=5 crossvalidate;
class group;
var wdim circum fbeye eyehd earhd jaw;
title 'Discriminant Analysis of Football Data';
run; 
