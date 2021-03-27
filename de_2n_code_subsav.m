function [c,ptr,cw,ck]=de_2n_code_sub(biny,n,z,ptr)

len=length(z); lenw=sum(z);
ptrinc=n*len;
tem=biny(ptr:ptr+ptrinc-1); ptr=ptr+ptrinc;
tem=char(tem+48);
tem=reshape(tem,n,len)';
tem=bin2dec(tem)'+1;

cw=tem(1:lenw); ck=tem(lenw+1:len);

c=separate_inv(z,cw+2^n,ck);
