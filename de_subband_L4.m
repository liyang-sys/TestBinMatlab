function [subband,ptr]=de_subband_L4(biny,N,ptr)
load H2ext;
lenz=N(1)*N(2);

[n,ptr]=deSFcode(biny,9,ptr); n=n-1;  %<==modified Dec 31, 2013
%[n,ptr]=deSFcode(biny,6,ptr); n=n-1; 
thd=2^n;

lB=biny(ptr); ptr=ptr+1;
[z1,ptr]=de_zone_sub2a(biny,lB,ptr);
len1=length(z1); lenw1=sum(z1); lenk1=len1-lenw1;
len2=sum(z1);

if thd>1
   [z1k,ptr]=de_z0(biny,lenk1,ptr);
   lenkw1=sum(z1k); lenkk1=lenk1-lenkw1;
   if n>1
      nd=n-1; ptrinc=nd*lenk1;
      tem=biny(ptr:ptr+ptrinc-1); ptr=ptr+ptrinc;
      tem=char(tem+48);
      tem=reshape(tem,nd,lenk1)';
      tem=bin2dec(tem)'+1;
      cf1kw=tem(1:lenkw1); cf1kk=tem(lenkw1+1:lenk1);
      cf1k=separate_inv(z1k,cf1kw+thd/2,cf1kk);
   else
      cf1k=z1k+1;
   end
else
   cf1k=ones(1,lenk1);
end

%next level ===========================================================
[z2,ptr]=de_z0(biny,len2,ptr);
lenw2=sum(z2); lenk2=len2-lenw2;

[z2k,ptr]=de_z0(biny,lenk2,ptr);
lenkw2=sum(z2k); lenkk2=lenk2-lenkw2;
if n>0
   ptrinc=n*lenk2;
   tem=biny(ptr:ptr+ptrinc-1); ptr=ptr+ptrinc;
   tem=char(tem+48);
   tem=reshape(tem,n,lenk2)';
   tem=bin2dec(tem)'+1;
   cf2kw=tem(1:lenkw2); cf2kk=tem(lenkw2+1:lenk2);
   cf2k=separate_inv(z2k,cf2kw+thd,cf2kk);
else
   cf2k=z2k+1;
end

[cf2,inv,ptr]=de_cfw2(biny,lenw2,ptr);

cf1=separate_inv(z2,cf2+2*thd,cf2k);
cf0=int16(separate_inv(z1,cf1+thd,cf1k)-1);

subband=zeros(N);
for ia=1:lenz
   if cf0(ia)>0
      cf0(ia)=cf0(ia)*sign(double(biny(ptr))-0.5); ptr=ptr+1;
   end
   subband(xx(ia),yy(ia))=cf0(ia);
end
