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
   bin=[0 0 0 bin];
elseif wuns > len*f1
   [bin,len]=encode_block3(z);
   bin=[0 0 1 bin];
elseif wuns > len*f2
   [bin,len]=encode_block5(z);
   bin=[0 1 0 bin];
elseif wuns > len * (1 - 0.5^(1/2.5))
   %[runs,lastBit,p]=Golomb0(z);
   bin=encode_stationary_source(runs,0); %codebook=0 is assumed here
   bin=[0 1 1 lastBit bin];
elseif wuns > len * (1 - 0.5^(1/3.5))
   %[runs,lastBit,p]=Golomb0(z);
   bin=encode_stationary_source(runs,1); %codebook=1 is assumed here
   bin=[1 0 0 lastBit bin];
elseif wuns > len * (1 - 0.5^(1/5))
   %[runs,lastBit,p]=Golomb0(z);
   bin=encode_stationary_source(runs,2); %codebook=2 is assumed here
   bin=[1 0 1 lastBit bin];
elseif wuns > len * (1 - 0.5^(1/7))
   %[runs,lastBit,p]=Golomb0(z);
   bin=encode_stationary_source(runs,3); %codebook=3 is assumed here
   bin=[1 1 0 lastBit bin];
else % wuns > len * (1 - 0.5^(1/10)): 
   %[runs,lastBit,p]=Golomb0(z); 
   bin=encode_stationary_source(runs,4); %codebook=4 is assumed here
   bin=[1 1 1 lastBit bin];
   fprintf('\n====> p may be outside the range in en_z0_r0.m! %1.4f > %1.4f? <=======\n', p, 1 - 0.5^(1/14));
end

bin=uint8(bin);
