function A=rstTHDctr(qA,T,delta,nc)
%Format: A=rstTHDctr1(qA,T,delta,ctr)
%To restore quantized codes ('THD' means threthold) to its original levels
%'ctr' is the center of the first level.

%Laplacian is worse than geometric!!! ----------------------------------------
%r1=nc(3)/nc(2);
%alpha1=-log(r1)/delta;
%c1_lap = 1/alpha1 - delta*r1/(1-r1);

%r2=(nc(4)+nc(3))/(nc(3)+nc(2));
%alpha2=-log(r2)/delta;
%c2_lap = 1/alpha2 - delta*r2/(1-r2);
%c12=[c1_lap/delta c2_lap/delta]
%------------------------------------------------------------------------------


qA=double(qA);
sn=sign(qA); absqA=abs(qA);
clear qA
offset=T-delta/2;

wuns=ones(size(absqA));

a3=1/3; b3=2/3; absA=zeros(size(absqA));

maxval=length(nc)-1;
[first0, idx]=min(nc); 
valT=1;
for val = 1 : idx-2
   na=nc(val+1); nb=nc(val+2);
   if nb>na
      valT=val;
      break;
   else
      valT=val+1;
   end
   ctr_geo = (a3*na+b3*nb)/(na+nb) *delta;
   %if val==1,   ctr_geo = 0.33 *delta;  end  %<== test the influnce of val=1, no need to precisely code val=1
   %if val==2,   ctr_geo = 0.23 *delta;  end  %<== test the influnce of val=1, no need to precisely code val=1
   map = wuns - abs(sign(absqA-val)); 	%map of the value at 'val'
   absA = absA   +    map*(T+(val-1)*delta+ctr_geo);
end

if maxval>1  %modified Mar 29, 2015. It still seems not necessory to code level 1 ctr. 
   for val = valT : maxval
      map = wuns - abs(sign(absqA-val)); 	%map of the value at 'val'
      absA = absA   +    map*(T+(val-0.5)*delta);
   end
else
   map = wuns - abs(sign(absqA-1)); 	%map of the value at 'val'
   absA = absA +  map*(T+0.37*delta);
end

A = absA.*sn;
