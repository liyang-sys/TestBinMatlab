function [bin,len]=en_z0_r0(z,runs,lastBit,p)
%This code is essentially the same as en_z0.m
%The only difference is that 'inv' ==> inversion is not performed!!!

f0 = 1/2 -1/16 -1/64;
f1 = 1/2 -1/8;
f2 = 1/4 +1/16;% +1/64;
len=length(z); wuns=sum(z);

%inv=0; 
%if 2*wuns>len
   %z=1-z;
   %wuns=len-wuns;
   %inv=1;
%end

if wuns >= len*f0
   bin=z;
   cbook=1;
elseif wuns > len*f1
   [bin,len]=encode_block3(z);
   cbook=2;
elseif wuns > len*f2
   [bin,len]=encode_block5(z);
   cbook=3;
else 
   [bin codebook]=encode_stationary_source(runs,p); %codebook=0 is assumed here
   bin=[lastBit bin];
   cbook=codebook+4;
end

bin=[SFcode(cbook,36) uint8(bin)];
