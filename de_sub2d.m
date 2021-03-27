function [sub,ptr,qcfr]=de_sub2d(bin,H,W,delta0,n,ptr)

len=length(n);
[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr

if binq(1)>0
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr); %ptr %%%%%%%%%%
   [sbr,ptrq]=rst_sb(binq,qcfr,delta0,1);
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
