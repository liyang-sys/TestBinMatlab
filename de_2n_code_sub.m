function [c,ptr,cw,ck]=de_2n_code_sub(biny,n,z,ptr)

power2s=cumprod([1 2*ones(1,30)]);

len=length(z); lenw=sum(z);
ptrinc=n*len;
tem=biny(ptr:ptr+ptrinc-1); ptr=ptr+ptrinc;
tem=reshape(tem,n,len)';
%tem=char(tem+48);
%tem=bin2dec(tem)'+1;

tem=double(tem); cr=zeros(len,1);
for ia=1:n
   cr = cr +tem(:,ia)*power2s(n-ia+1);
end
cr=cr'+1;

cw=cr(1:lenw); ck=cr(lenw+1:len);
c=separate_inv(z,cw+2^n,ck);
