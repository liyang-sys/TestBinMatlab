function [T,h,T2,h2]=find_T_and_Del(sub,delta)

sz=size(sub); N=prod(sz);
qcoef=abs(quanTHD(sub,delta,delta));

zn1=sign(qcoef);
n1t=sum(sum(sum(zn1)));
n0=N-n1t;

qcoef1=qcoef-zn1;
zn2=sign(qcoef1);
n2t=sum(sum(sum(zn2)));
n1=n1t-n2t;

qcoef2=qcoef1-zn2;
zn3=sign(qcoef2);
n3t=sum(sum(sum(zn3)));
n2=n2t-n3t;


alpha=-log(n1/n0);
[T,h]=find_thred_laplace(alpha); 

if n2>=3
   alph=-log(n2/n1);
   [T2,h2]=find_thred_laplace(alph);   
else
   T2=T; h2=h;
end
