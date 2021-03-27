function a=dyadic_periodic_recon(coef,lev)


len=length(coef); len1=len/2; len2=len1/2; len3=len2/2; len4=len3/2; len5=len4/2;

if lev==4
   b=idwt(coef(1:len4),coef(len4+1:len3),'rbio1.3','mode','per');
else
   b=idwt(coef(1:len5),coef(len5+1:len4),'rbio1.3','mode','per');
   b=idwt(b,coef(len4+1:len3),'rbio1.3','mode','per');
end

b=idwt(b,coef(len3+1:len2),'rbio1.3','mode','per');
b=idwt(b,coef(len2+1:len1),'rbio1.3','mode','per');
a=idwt(b,coef(len1+1:len),'rbio1.3','mode','per');
   