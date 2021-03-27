function [cf,sn,ptr,cf0]=de_sub3d_sub2(bin,len,ptr)

th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); thd_arr=[1 th];
Nidx=length(thd_arr);

Nsep=bin(ptr)*4 +bin(ptr+1)*2 +bin(ptr+2) +1;   ptr=ptr+3;

z=cell(1,Nsep); cfk=cell(1,Nsep); thd=zeros(1,Nsep);
for n=1:Nsep
   [thd_idx,ptr] = deSFcode(bin,Nidx,ptr);
   thd(n)=thd_arr(thd_idx); %%%%%%%%%%%%%
   [z{n},cfk{n},ptr]=de_sub3d_sub2_sub(bin,thd(n),len,ptr);
   len=sum(z{n});
end

[cf,inv,ptr]=de_r0(bin,sum(z{n}),ptr);
for n=Nsep:-1:1
   cf=separate_inv(z{n},cf+thd(n),cfk{n});
end
cf0=cf-1;

lensn=sum(abs(sign(cf0)));
sn=bin(ptr:ptr+lensn-1);   ptr=ptr+lensn;
sn=sign(double(sn)-0.5);
ns=0; cf=cf0;
for ia=1:length(cf)
   if cf(ia)~=0
      ns=ns+1;
      cf(ia)=double(cf(ia))*double(sn(ns));
   end
end
