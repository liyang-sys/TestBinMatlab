function [subr]=en_sub3d_dum(sub,n,delta0)

len=numel(sub);  sb=zeros(1,len);
for ia=1:len
   sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
end
[qcf,binq]=quant_sub(sb,delta0); %ctr1 %%%%%%%%%%%%%%%%%

%-------------------------------------------------

if binq(1)>0
   [sbr]=rst_sub(binq,qcf,delta0,1);
   subr=coef_scan3d_inv(sbr,n);
else
   subr=zeros(size(sub));
end
