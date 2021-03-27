function [T,h]=find_subband_threshold(sub,delta,Tni)

%'Tni' is the normalized initial quantization threshold

sz=size(sub); N=sz(1)*sz(2)*sz(3);
del=Tni*delta;
qcoef=abs(quanTHD(sub,del,del));

zn1=sign(qcoef);
n1t=sum(sum(sum(zn1)));
n0=N-n1t;

qcoef1=qcoef-zn1;
zn2=sign(qcoef1);
n2t=sum(sum(sum(zn2)));
n1=n1t-n2t;

alpha=-log(n1/n0)/Tni;

[T,h]=find_thred_laplace(alpha);
