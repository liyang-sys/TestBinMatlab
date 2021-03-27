function [bin,len]=en_KsideSub(c)

f0 = 1/2 -1/16 -1/64;
f1 = 1/2 -1/8;
f2 = 1/4 +1/16;% +1/64;
len=length(c); wuns=sum(c);

inv=0;
if 2*wuns>len
   c=1-c;   wuns=len-wuns;   inv=1;
end

%p=[wuns/len,(1 - 0.5^(1/3.5)),(1 - 0.5^(1/5)),(1 - 0.5^(1/7))] %%%%%%%%%%%%%%%%%%%%%%%%%%%

if wuns >= len*f0
   bin=c;
   bin=[ 0 0 bin inv];
elseif wuns > len*f1
   bin=encode_block3(c);
   bin=[ 0 1 bin inv];
elseif wuns > len*f2
   %fprintf('\nhere====================\n')
   bin=encode_block5(c);
   bin=[ 1 0 bin inv];
elseif wuns > len * (1 - 0.5^(1/2.5))
   [runs,lastBit,p]=Golomb0(c);
   bin=encode_stationary_source(runs,0); %codebook=0 is assumed here
   bin=[1 1 0 uint8(lastBit) bin inv];
elseif wuns > len * (1 - 0.5^(1/3.5))
   [runs,lastBit,p]=Golomb0(c);
   bin=encode_stationary_source(runs,1); %codebook=1 is assumed here
   bin=[1 1 1 0 uint8(lastBit) bin inv];
else %wuns < len * (1 - 0.5^(1/3.5))
   [runs,lastBit,p]=Golomb0(c);
   bin=encode_stationary_source(runs,2); %codebook=2 is assumed here
   bin=[ 1 1 1 1 uint8(lastBit) bin inv];
   fprintf('\n\n===> p may be outside the range in enKsideSub.m! %1.4f > %1.4f?  <======\n\n',wuns/len, 1 - 0.5^(1/5));
end

bin=uint8(bin);
