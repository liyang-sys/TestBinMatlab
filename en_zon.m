function [biny,sep,r]=en_zon(z)
%For shorter length z, for example, z1.

[r,lastBit,pz]=Golomb0(z); lastBit=uint8(lastBit);

n=hist(r,[1:max(r)]);
lenz=length(z); sumz=sum(z);
if n(1)+n(2)<=2  || (lenz<1024 && sumz<8)
   biny=[lastBit uint8(SFcode(1,4))];
   [bin,codebook]=encode_stationary_source(r,pz); 
   codebook=uint8( abs(dec2bin(codebook,5)) -48 );
   biny=[biny codebook bin];
   sep=0;
elseif lenz<=1024  ||  sumz<64
   biny=[lastBit uint8(SFcode(2,4))];
   Nsep=1; [biny,sep]=en_zone_sub3(r,n,Nsep,biny);
elseif lenz<=4096  ||  sumz<384
   biny=[lastBit uint8(SFcode(3,4))];
   [biny,sep]=en_zone_sub2(r,biny);
else
   biny=[lastBit uint8(SFcode(4,4))];
   [biny,sep]=en_zone_sub(r,biny);
end
   