function [runs,lastBit,p]=Golomb0(z)
%unlike Golumb, Golomb0 does not have automatic inversion of z.

len=length(z);
runs=zeros(1,len); Nr=1;
for ia=1:len
   runs(Nr)=runs(Nr)+1;
   if z(ia)>0
      Nr=Nr+1;
   end
end

lastBit=z(len);
if lastBit>0
   runs=runs(1:Nr-1);
else
   runs=runs(1:Nr);
end

p=length(runs)/sum(runs);