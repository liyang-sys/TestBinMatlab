function [rk,ptr,c]=de_Kside_low_p(bin,thd,lenr,ptr)


inv=bin(ptr); ptr=ptr+1;
[sep,ptr]=de_KsideSub(ptr,bin,lenr);
if inv==1, sep=1-sep; end


bn=bin(ptr); ptr=ptr+1;  lenA=sum(sep);
lenc=lenr-lenA;

if bn<1
   c=zeros(1,lenc);
else
   lBc=bin(ptr); ptr=ptr+1;
   codebook=bin2dec(char(bin(ptr:ptr+4)+48));  ptr=ptr+5;
   [rc,ptr]=decode_stationary_source_sumr(bin,codebook,lenc,ptr);
   c=GolombInv(rc,lBc);
end
rB=c+1;

codebook=bin2dec(char(bin(ptr:ptr+4)+48));  ptr=ptr+5;
[rA,ptr]=decode_stationary_source_Nsym_lenr(bin,codebook,lenA,thd-2,ptr);

rk=separate_inv(sep,rA+2,rB);
