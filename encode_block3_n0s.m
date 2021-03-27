function [bin,len,nrs,resid]=encode_block3_n0s(z)
%The code is orginally used in de_cfw2.m (en_cfw2.m).
%The last bit of z must be '0' (see en_cfw2.m) !!!!!!!!!!!!!!!!!!!!

len=length(z); 
N=floor(len/3);  resid=z(3*N+1:len);
nrs=sum(resid);
nrs=length(resid)-nrs; %<=== this is different from encode_block3.m

codebook=cell(8,1);
codebook{1}=uint8([0 0]);
codebook{2}=uint8(dec2bin(2,3)-48);
codebook{3}=uint8(dec2bin(3,3)-48);
codebook{4}=uint8(dec2bin(4,3)-48);
codebook{5}=uint8(dec2bin(5,3)-48);
codebook{6}=uint8(dec2bin(6,3)-48);
codebook{7}=uint8(dec2bin(14,4)-48);
codebook{8}=uint8(dec2bin(15,4)-48);

bin=[];
for ia=1:N
   block=z( (ia-1)*3+1 : ia*3);
   sumb=sum(block);
   if sumb==0
      bin=[bin codebook{1}];
   elseif sumb==1
      if block(3)==1
         bin=[bin codebook{2}];
      elseif block(2)==1
         bin=[bin codebook{3}];
      else
         bin=[bin codebook{4}];
      end
   elseif sumb==2
      if block(3)==0
         bin=[bin codebook{5}];
      elseif block(1)==0
         bin=[bin codebook{6}];
      else
         bin=[bin codebook{7}];
      end
   else
      bin=[bin codebook{8}];
   end
end

bin=[SFcode(nrs+1,3) bin uint8(resid)];

%compress=length(bin)/length(z);
%expand=compress/H(p);
%pbin=sum(bin)/length(bin);

