function [sub1,sub2,sub3,ptr,qcfr]=de_sub3d3(bin,len,delta0,n,ptr)

[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr
if binq(1)>0
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr); %ptr %%%%%%%%%%
   [sbr,ptrq]=rst_sub(binq,qcfr,delta0,1);
else
   sbr=zeros(1,length(n));
end

len=length(sbr)/3;
sub1=coef_scan3d_inv(sbr(1:len),n);
sub2=coef_scan3d_inv(sbr(len+1:len+len),n);
sub3=coef_scan3d_inv(sbr(len+len+1:len+len+len),n);
