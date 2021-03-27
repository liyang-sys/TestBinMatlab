function [biny,sep,r]=en_zone(z)

p0=16/65536; p1=64/65536; p2=128/65536; p3=384/65536; p4=1024/65536; p5=2048/65536;

[r,lastBit,pz]=Golomb0(z); lastBit=uint8(lastBit);
n=hist(r,[1:max(r)]);
lenz=length(z); sumz=sum(z);

%p=[pz p0 p1 p2 p3 p4 p5] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if pz<p0  ||  n(1)+n(2)<=2  || (lenz<1024 && sumz<8)
   biny=[lastBit uint8(SFcode(1,7))];
   [bin,codebook]=encode_stationary_source(r,pz); 
   codebook=uint8( abs(dec2bin(codebook,5)) -48 );
   biny=[biny codebook bin];
   sep=0;
elseif pz<p1 || (lenz<=1024 && sumz<32)
   biny=[lastBit uint8(SFcode(2,7))];
   Nsep=1; [biny,sep]=en_zone_sub3(r,n,Nsep,biny);
elseif pz<p2 || (lenz<=2048 && sumz<64)
  % fprintf('\n333333333333333333333333\n');
   biny=[lastBit uint8(SFcode(3,7))];
   Nsep=2; [biny,sep]=en_zone_sub3(r,n,Nsep,biny);
elseif pz<p3 || (lenz<=4096 && sumz<196)
 %  fprintf('\n444444444444444444444444\n');
   biny=[lastBit uint8(SFcode(4,7))];
   Nsep=3; [biny,sep]=en_zone_sub3(r,n,Nsep,biny);
elseif pz<p4 %|| (lenz<=4096 && sumz<512) %<==modified 20/08/2013
%   fprintf('\n555555555555555555555555\n');
   biny=[lastBit uint8(SFcode(5,7))];
   Nsep=4; [biny,sep]=en_zone_sub3(r,n,Nsep,biny);
%elseif pz<p5 || (lenz<=8192 && sumz<2048) %<===== needs to be looked at!!!
elseif pz<p5 || (lenz<=8192 && pz>0.375) %??????
   %fprintf('\n666666666666666666666666\n');
   biny=[lastBit uint8(SFcode(6,7))];
   [biny,sep]=en_zone_sub2(r,biny);
else
   %fprintf('\n7777777777777777777777777\n')
   biny=[lastBit uint8(SFcode(7,7))];
   [biny,sep]=en_zone_sub(r,biny);
   
   %[bintem,sep]=en_zone_sub2(r,binn);
   %[length(biny) length(bintem)]
end
   