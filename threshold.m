function [b,nonzero,zerozone]=threshold(a,T)

at=round(a/(2*T));
zerozone=abs(sign(at));
nonzero=sum(sum(sum(zerozone)));
b=a.*zerozone;

zerozone=uint8(255*(1-zerozone));
