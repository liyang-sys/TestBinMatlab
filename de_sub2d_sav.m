function [sub,ptr]=de_sub2d(bin,len,delta0,n,ptr)

[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr

if binq(1)>0
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr); %ptr %%%%%%%%%%

   %[sbr,ptrq]=rst_sub(binq,qcfr,delta0,1);
   %[sbr,ptrq]=rst_sub_new(binq,qcfr,delta0,1);   
   [sbr,ptrq]=rst_sb(binq,qcfr,delta0,1);
   %[sbr,ptrq]=rst_sb_tem(binq,qcfr,delta0,1);
else
   sbr=zeros(1,len);
end

if floor(len/3)+0.1 < len/3
   N=sqrt(len); sub=zeros(N,N);
   for ia=1:len
      sub(n(1,ia),n(2,ia))=sbr(ia);
   end
else
   len=len/3;
   N=sqrt(len); sub=zeros(N,3*N);
   sub=[];
   for ib=1:3
      ssub = zeros(N,N); 
      ssbr = sbr( (ib-1)*len+1 : ib*len );
      for ia=1:len
         ssub(n(1,ia),n(2,ia))=ssbr(ia);
      end
      sub=[sub ssub];
   end
end
