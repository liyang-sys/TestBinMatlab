function A=rstEVEN(qA,delta)

qA=double(qA);
sn=sign(qA); absqA=abs(qA);
clear qA

absA=(absqA-1)*delta;
absA = absA +0.5*delta;  %restore at center

A = absA.*sn;
