function A=rstTHDctr1(qA,T,delta,ctr1,ctr2)
%Format: A=rstTHDctr1(qA,T,delta,ctr)
%To restore quantized codes ('THD' means threthold) to its original levels
%'ctr' is the center of the first level.

qA=single(qA);
sn=sign(qA); absqA=abs(qA);
clear qA
offset=single(T-delta/2);

map1=ones(size(absqA)) - abs(sign(absqA-1)); 	%map of the value at '1'
map2=ones(size(absqA)) - abs(sign(absqA-2)); 	%map of the value at '2'
absA = absqA*delta + offset   +    map1*(-(delta+offset)+(T+ctr1));
absA = absA   +    map2*(-(2*delta+offset)+(T+delta+ctr2));

A = absA.*sn;
