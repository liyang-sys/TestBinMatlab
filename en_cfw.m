function [bin,c]=en_cfw(cfw)

pw=length(cfw)/sum(cfw);
inv=0;   lastRun=cfw(length(cfw));
if pw>0.58
   inv=1;
   cfw=KW_inversion_runs(cfw);
   pw=length(cfw)/sum(cfw);
end

p0 = 1/2 -1/16 -1/64;
p1 = 1/2 -1/8;
p2 = 1/4 +1/16; % +1/64;

if pw >= p0 && inv==0
   c=GolombInv(cfw,1);
   bin=[0 0 c];
elseif pw > p1
   if inv==0
      c=GolombInv(cfw,1);
      [bin,len,nrs]=encode_block3(c);
   else
      c=GolombInv(cfw,0);
      [bin,len,nrs,resid]=encode_block3(c);
      nrs=length(resid)-nrs;
   end
   bin=[0 1 SFcode(nrs+1,3) bin];
elseif pw > p2
   if inv==0
      c=GolombInv(cfw,1);  %lenc=length(c) %%%%%%%%%%%%%%%%
      [bin,len,nrs,resid,codebook]=encode_block5(c); %nrs%%%%%%%%%%%
      if length(resid)>3 && sum(resid)==1 %situation a '0 0 0 0 0' block will be decoded
         flg=1;
      else
         flg=0;
      end
      bin=[SFcode(nrs+1,5) flg bin];
  else
      c=GolombInv(cfw,0);
      [bin,len,nrs,resid,codebook]=encode_block5(c);
      nrs=length(resid)-nrs; 
      bin=[SFcode(nrs+1,5) bin];
   end
   bin=[1 0 0 bin];
elseif pw > (1 - 0.5^(1/2.5))
   bin=encode_stationary_source_r_invr(cfw,inv,lastRun, 0);
   bin=[1 0 1 bin];
elseif pw > (1 - 0.5^(1/3.5))
   bin=encode_stationary_source_r_invr(cfw,inv,lastRun, 1);
   bin=[1 1 0 bin];
elseif pw > (1 - 0.5^(1/5))
   bin=encode_stationary_source_r_invr(cfw,inv,lastRun, 2);
   bin=[1 1 1 0 bin];
else
   bin=encode_stationary_source_r_invr(cfw,inv,lastRun, 3);
   bin=[1 1 1 1 bin];
end


bin=[inv bin];
bin=uint8(bin);

