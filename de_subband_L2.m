function [subband,ptr]=de_subband_L2(bin,N,ptr)

load H2ext

lenz=N(1)*N(2);
bn=bin(ptr); ptr=ptr+1;

if bn==1
   [cf0,sn,ptr]=de_subband_sub1_L2(bin,lenz,ptr);
else
   [cf0,sn,ptr]=de_subband_sub2_L2(bin,lenz,ptr);
end

%---------------------------------------------------------------------------
subband=zeros(N);
k=1;
for ia=1:lenz
   if cf0(ia)>0
      subband(xx(ia),y(ia))=cf0(ia)*sn(k);
      k=k+1;
   end
end
