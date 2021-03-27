function [cf,z,sn,cf1]=coef_sign(coef)

load H2ext
sz=size(coef); len=sz(1)*sz(2);
cf=int16(zeros(1,len));
for n=1:len
   cf(n)=coef(routxy(1,n),routxy(2,n));
end

cf1=int16(zeros(1,len));
z=uint8(zeros(1,len));
pc1=0;
for ia=1:len
   if cf(ia)~=0
      pc1=pc1+1;
      cf1(pc1)=cf(ia);
      z(ia)=1;
   end
end
cf1=cf1(1:pc1);

sn=uint8(abs(sign(sign(double(cf1))+1)));
cf1=uint16(abs(cf1)); cf=uint16(abs(cf));
