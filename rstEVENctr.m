function A=rstEVENctr(qA,delta,nc,ctr1)

qA=double(qA);
sn=sign(qA); absqA=abs(qA);
clear qA

absA=(absqA-1)*delta;
%absA0 = absA +0.5*delta;  %restore at center

wuns=ones(size(absqA));
ctr1=(ctr1*0.125/64+0.375)*delta;

map = wuns - abs(sign(absqA-1));  absA = absA + map*ctr1;  %restore 1's

%restore 3 and above:
a3=1/3; b3=2/3; 
maxval=length(nc);
[first0, idx]=min(nc);
for val = 2 : idx-2
   na=nc(val); nb=nc(val+1);
   ctr_geo = (a3*na+b3*nb)/(na+nb) *delta;
   map = wuns - abs(sign(absqA-val)); 	%map of the value at 'val'
   absA = absA   +    map*ctr_geo;
end

for val = idx-1 : maxval
   map = wuns - abs(sign(absqA-val)); 	%map of the value at 'val'
   absA = absA   +    map*(0.5*delta);
end

%absA=absA0;
A = absA.*sn;
