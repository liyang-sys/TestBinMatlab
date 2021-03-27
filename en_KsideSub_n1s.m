function [bin,len]=en_KsideSub_n1s(c)

f0 = 1/2 -1/16 -1/64;
f1 = 1/2 -1/8;
f2 = 1/4 +1/16;% +1/64;
len=length(c); wuns=sum(c);

%p=wuns/len %%%%%%%%%%%%%%%%%%%%%%%%%%%

if wuns >= len*f0
   bin=c;
   bin=[0 0 bin];
elseif wuns > len*f1
   [bin,len,nrs]=encode_block3(c);
   bin=[0 1 SFcode(nrs+1,3) bin];
elseif wuns > len*f2
   [bin,len,nrs,resid]=encode_block5(c);
   if length(resid)>3 && sum(resid)==1 %situation a '0 0 0 0 0' block will be decoded
      flg=1;
   else
      flg=0;
   end
   bin=[1 0 SFcode(nrs+1,5) flg bin];
elseif wuns > len * (1 - 0.5^(1/2.5))
   [runs,lastBit,p]=Golomb0(c);
   bin=encode_stationary_source(runs,0.29); %codebook=0 is assumed here
   bin=[1 1 lastBit bin];
else
   fprintf('\n\n========> p outside the range !!!!! <=========\n\n');
end

bin=uint8(bin);
