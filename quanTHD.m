function [qA,ctr1]=quanTHD(A,T,delta)
%Format: [qAchar,den,ctt,ctr,qA]=quanTHD(delta,T,A)
%To quantize a subband. 'THD' means variable threshold

A=double(A);
snA=sign(A);

offset=T-delta/2;
ps_qA=round((abs(A)-offset)/delta);

sn1=sign(ps_qA);
sn=sign(snA.*(sn1+1));  %<=========eleminating negative coeffs from dead zone

qA=ps_qA.*sn;
%qA=int16(qA);

%-----------------------------------------------------------
absqA=abs(qA);
wuns=ones(size(absqA));

val=1; quantized1s=abs(sign(absqA-val));  
map = wuns - quantized1s; 	%map of the value at 'val'
absA1=abs(A).*map;

sum_map=sum(sum(sum(map)));
if sum_map>0
   ctr1 = 0.5 - (sum(sum(sum(absA1)))/sum_map -T )/delta;
else
   ctr1 = 0;
end
