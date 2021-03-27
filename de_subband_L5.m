function [subband,ptr]=de_subband_L5(biny,N,ptr)
load H2ext;
lenz=N(1)*N(2);

[codebook,ptr]=deSFcode(biny,20,ptr); codebook=codebook-1;
[cf0,ptr]=decode_stationary_source_lenr(biny,codebook,lenz,ptr);
cf0=cf0-1;

subband=zeros(N);
for ia=1:lenz
   if cf0(ia)>0
      cf0(ia)=cf0(ia)*sign(double(biny(ptr))-0.5); ptr=ptr+1;
   end
   subband(x(ia),y(ia))=cf0(ia);
end
