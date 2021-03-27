function [runs,inv_ck,lastBit,p]=Golomb(z)

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

inv_ck=0;
[runs,inv_ck]=inversion_check(runs);
if inv_ck==1,  lastBit=1-lastBit;  end

p=length(runs)/sum(runs);