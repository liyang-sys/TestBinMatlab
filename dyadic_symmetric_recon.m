function a=dyadic_symmetric_recon(coef,lev)


len=size(coef,1); len1=len/2; len2=len1/2; len3=len2/2; len4=len3/2; len5=len4/2;

if lev==4
   b=rec26(coef(1:len4,:),coef(len4+1:len3,:));
else
   b=rec26(coef(1:len5,:),coef(len5+1:len4,:));
   b=rec26(b,coef(len4+1:len3,:));
end

b=rec26(b,coef(len3+1:len2,:));
b=rec26(b,coef(len2+1:len1,:));
a=rec26(b,coef(len1+1:len,:));
   