function [bin,c]=en_r0(r)

pw=length(r)/sum(r);

inv=0;   lastRun=r(length(r));
if pw>0.58
   inv=1;
   r=KW_inversion_runs(r);
   pw=length(r)/sum(r);
end

p0 = 1/2 -1/16 -1/64;
p1 = 1/2 -1/8;
p2 = 1/4 +1/16; % +1/64;

if pw >= p0 && inv==0
   c=GolombInv(r,1);
   bin=c;   cbook=1;
elseif pw > p1
   if inv==0
      c=GolombInv(r,1);
      [bin,len,nrs]=encode_block3(c); 
   else
      c=GolombInv(r,0);
      [bin,len,nrs,resid]=encode_block3(c);
      nrs=length(resid)-nrs;
   end
   bin=[SFcode(nrs+1,3) bin];   cbook=2;
elseif pw > p2
   if inv==0
      c=GolombInv(r,1);  %lenc=length(c) %%%%%%%%%%%%%%%%
      [bin,len,nrs,resid,codebook]=encode_block5(c); %nrs%%%%%%%%%%%
      if length(resid)>3 && sum(resid)==1 %situation a '0 0 0 0 0' block will be decoded
         flg=1;
      else
         flg=0;
      end
      bin=[SFcode(nrs+1,5) flg bin];
  else
      c=GolombInv(r,0);
      [bin,len,nrs,resid,codebook]=encode_block5(c);
      nrs=length(resid)-nrs; 
      bin=[SFcode(nrs+1,5) bin];
   end
   cbook=3;
else
   if length(r)==1 && inv==1
      cbook=37; bin=[];
   else
      [bin,codebook]=encode_stationary_source_r_invr(r,inv,lastRun,pw);
      cbook=codebook+4;
   end
end

bin=[inv SFcode(cbook,37) bin];
bin=uint8(bin);

