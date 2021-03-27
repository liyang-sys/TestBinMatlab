function [cf0,abssb,sb,sn_z,z,sn,cf1]=coef_scan3d(sub,qcf,n)

len=length(n);
qcf=int16(qcf); 
cf0=int16(zeros(1,len)); sb=zeros(1,len); cf1=cf0;
cf0=zeros(1,len); sb=zeros(1,len); cf1=cf0;
ptr=1;
for ia=1:len
   cf0(ia)=qcf(n(1,ia),n(2,ia),n(3,ia));
   sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
   if cf0(ia)~=0
      cf1(ptr)=cf0(ia);
      ptr=ptr+1;
   end
end

cf1=cf1(1:ptr-1);
sn=uint8(sign(sign(cf1)+1)); cf1=abs(cf1);

sn_z=int8(sign(cf0)); z=abs(sn_z);
cf0=abs(cf0); abssb=abs(sb); 
