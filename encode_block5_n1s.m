function [bin,len,nrs,resid,codebook]=encode_block5_n1s(z)

len=length(z);
N=floor(len/5);
resid=z(5*N+1:len);
nrs=sum(resid); %%%%%%%%%%%

codebook=cell(32,1);
codebook{1}=uint8([0 0 0]);
idx0=2; code_idx0=2*1;
for ia=0:4
   codebook{idx0+ia}=uint8(dec2bin(code_idx0+ia,4)-48);
end
idx0=idx0+ia+1; code_idx0=(code_idx0+ia+1)*2;
for ia=0:13
   codebook{idx0+ia}=uint8(dec2bin(code_idx0+ia,5)-48);
end
idx0=idx0+ia+1; code_idx0=(code_idx0+ia+1)*2;
for ia=0:4
   codebook{idx0+ia}=uint8(dec2bin(code_idx0+ia,6)-48);
end
idx0=idx0+ia+1; code_idx0=(code_idx0+ia+1)*2;
for ia=0:4
   codebook{idx0+ia}=uint8(dec2bin(code_idx0+ia,7)-48);
end
codebook{31}=uint8('11111110'-48);
codebook{32}=uint8('11111111'-48);

%for ia=1:32
 %  codebook{ia}
%end

bin=[];
for ia=1:N
   block=z( (ia-1)*5+1 : ia*5);
   sumb=sum(block);
   if sumb==0
      bin=[bin codebook{1}];
   elseif sumb==1
      [val,idx]=max(block);
      bin=[bin codebook{7-idx}];
   elseif sumb==2
      if block==[0 0 0 1 1]
         bin=[bin codebook{7}];
      elseif block==[0 0 1   1 0]
         bin=[bin codebook{8}];
      elseif block==[0 0 1   0 1]
         bin=[bin codebook{9}];
      elseif block==[0 1   1 0 0]
         bin=[bin codebook{10}];
      elseif block==[0 1   0 1 0]
         bin=[bin codebook{11}];
      elseif block==[0 1   0 0 1]
         bin=[bin codebook{12}];
      elseif block==[1   1 0 0 0]
         bin=[bin codebook{13}];
      elseif block==[1   0 1 0 0]
         bin=[bin codebook{14}];
      elseif block==[1   0 0 1 0]
         bin=[bin codebook{15}];
      else
         bin=[bin codebook{16}];
      end
   elseif sumb==3
      if block==[1 1 1 0 0]
         bin=[bin codebook{17}];
      elseif block==[1 1 0   0 1]
         bin=[bin codebook{18}];
      elseif block==[1 1 0   1 0]
         bin=[bin codebook{19}];
      elseif block==[0   0 1 1 1]
         bin=[bin codebook{20}];
      elseif block==[0   1 0 1 1]
         bin=[bin codebook{21}];
      elseif block==[0   1 1 0 1]
         bin=[bin codebook{22}];
      elseif block==[0   1 1 1 0]
         bin=[bin codebook{23}];
      elseif block==[1 0   0 1 1]
         bin=[bin codebook{24}];
      elseif block==[1 0   1 1 0]
         bin=[bin codebook{25}];
      else
         bin=[bin codebook{26}];
      end
   elseif sumb==4
      if block(5)==0
         bin=[bin codebook{27}];
      elseif block(4)==0
         bin=[bin codebook{28}];
      elseif block(3)==0
         bin=[bin codebook{31}];
      elseif block(2)==0
         bin=[bin codebook{29}];
      elseif block(1)==0
         bin=[bin codebook{30}];
      end
   else
      bin=[bin codebook{32}];
   end
end

if length(resid)>3 && sum(resid)==1 %situation a '0 0 0 0 0' block will be decoded
   flg=1;
else
   flg=0;
end
bin=[SFcode(nrs+1,5) flg bin uint8(resid)];
