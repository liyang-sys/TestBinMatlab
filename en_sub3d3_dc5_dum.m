function [subr,subr2,subr3]=en_sub3d3_dc5_dum(sub,sub2,sub3,n,delta0)

sb=coef_scan2d(sub,n);
sb2=coef_scan2d(sub2,n);
sb3=coef_scan2d(sub3,n);

sb=[sb sb2 sb3];

[qcf,binq,qctr]=quant_sub(sb,delta0); %ctr1 %%%%%%%%%%%%%%%%%


if binq(1)>0
   [sbr,ptrq]=rst_sub(binq,qcf,delta0,1);
else
   sbr=zeros(1,length(n));
end

len=length(sbr)/3;
subr=coef_scan2d_inv(sbr(1:len),n);
subr2=coef_scan2d_inv(sbr(len+1:len+len),n);
subr3=coef_scan2d_inv(sbr(len+len+1:len+len+len),n);
