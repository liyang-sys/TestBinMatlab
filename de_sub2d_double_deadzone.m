function [sub,ptr,qcfr]=de_sub2d_double_deadzone(bin,H,W,delta0,n,ptr)

len=length(n);
fg=bin(ptr); ptr=ptr+1;
if fg>0
   qctr=1;
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr);

   nc=hist(abs(qcfr)+1,[1:max(abs(qcfr))+1]);
   sbr=rstTHDctr(qcfr,delta0,delta0,nc);
else
   sbr=zeros(1,len);
end

if H~=0
   sub=zeros(H,W);
   for ia=1:len
      sub(n(1,ia),n(2,ia))=sbr(ia);
   end
else
   sub=sbr;
end
