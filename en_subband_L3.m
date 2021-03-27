function [biny,cf0]=en_subband_L3(subband,aspect)

if aspect==0
   [cf0,z,sn,cfnon]=coef_sign(subband);
else
   [cf0,z,sn,cfnon]=coef_sign54(subband,3);
end
maxcf0=double(max(cf0));
%max_mean=[maxcf0 mean(double(cfnon))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cf0=cf0+1; %<=== treat cf0 as runs!
maxcf=maxcf0+1;
nc=hist(double(cf0),[1:maxcf]);

thd = find_thd_round(nc,0.5);
n=round(log2(thd));
thd=2^n;

[z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;
[r1,lB]=Golomb0(z1); lB=uint8(lB);
[bin1,sep]=en_zone_sub2(r1,lB);
if thd>1
   [z1k,cf1kw,cf1kk]=separate(cf1k,thd/2);   cf1kw=cf1kw-thd/2;
   [bin,len]=en_z0(z1k);  bin1=[bin1 bin];
   
   if n>1
      bin=dec2bin([cf1kw cf1kk]-1,n-1); 
      bin=reshape(bin',1,(n-1)*length(z1k));
      bin1=[bin1 uint8(abs(bin)-48)]; 
   end
end


if length(cf1)>length(cf0)/4
   %next level ===========================================================
   [z2,cf2,cf2k]=separate(cf1,2*thd);   cf2=cf2-2*thd;
   [r2,lB]=Golomb0(z2); lB=uint8(lB);
   [bin2,sep]=en_zone_sub2a(r2,lB);

   [z2k,cf2kw,cf2kk]=separate(cf2k,thd);   cf2kw=cf2kw-thd;
   [bin,len]=en_z0(z2k);  bin2=[bin2 bin];

   if n>0
      bin=dec2bin([cf2kw cf2kk]-1,n); 
      bin=reshape(bin',1,n*length(z2k));
      bin2=[bin2 uint8(abs(bin)-48)];
   end

   bin2w=en_cfw2(cf2);

   biny=[uint8(SFcode(n+1,6)) bin1 1 bin2 bin2w sn];
else
   bin1w=en_cfw2(cf1);
   biny=[uint8(SFcode(n+1,6)) bin1 0 bin1w sn];
end
