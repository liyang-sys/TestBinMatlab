function [subr,qcf,sb]=en_sub3d_dc5_dum(sub,n,delta0)

sb=coef_scan2d(sub,n);
[qcf,binq,qctr]=quant_sub(sb,delta0);

if binq(1)>0
   [sbr,ptrq]=rst_sub(binq,qcf,delta0,1);
else
   sbr=zeros(1,numel(sub));
end
w=sqrt(length(n));
subr=coef_scan2d_inv(sbr,w,w,n);
