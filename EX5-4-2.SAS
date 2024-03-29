/* EXAMPLE 5.4.2 */

FILENAME PSYCH 'T5_1_PSYCH.dat';
DATA SCORES;
  INFILE PSYCH;
  INPUT Sex Test1 Test2 Test3 Test4;
TITLE 'EXAMPLE 5.4.2';
PROC IML;
  USE SCORES;
  READ ALL VAR {Test1 Test2 Test3 Test4} INTO X;
  X1 = X[1:32,];
  X2 = X[33:64,];
  RESET PRINT;
  N1 = NROW(X1);
  N2 = NROW(X2);
  X1BAR = 1/N1*X1`*J(N1,1);
  X2BAR = 1/N2*X2`*J(N2,1);
  S1 = 1/(N1-1)*X1`*(I(N1)-1/N1*J(N1))*X1;     /* W1 = X1`*(I(N1)-1/N1*J(N1))*X1 */
  S2 = 1/(N2-1)*X2`*(I(N2)-1/N2*J(N2))*X2;     /* W2 = X2`*(I(N2)-1/N2*J(N2))*X2 */
  Spl = 1/(N1+N2-2)*((N1-1)*S1+(N2-1)*S2);     /* Spl = 1/(N1+N2-2)*(W1+W2)      */
  T2 = N1*N2/(N1+N2)*(X1BAR-X2BAR)`*INV(Spl)*(X1BAR-X2BAR);
RUN;