function [subr,subr2,subr3]=en_sub3d3_dum(sub,sub2,sub3,n,delta0)

%[cf_tem,abssb,sb]=coef_scan3d(sub,sub,n);
%[cf_tem,abssb,sb2]=coef_scan3d(sub2,sub2,n);
%[cf_tem,abssb,sb3]=coef_scan3d(sub3,sub3,n);

len0=numel(sub);  sb=zeros(1,len0); sb2=sb; sb3=sb;
for ia=1:len0
   sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
   sb2(ia)=sub2(n(1,ia),n(2,ia),n(3,ia));
   sb3(ia)=sub3(n(1,ia),n(2,ia),n(3,ia));
end

sb=[sb sb2 sb3];
[qcf,binq]=quant_sub(sb,delta0);


%-------------------------------------------------------

if binq(1)>0
   sbr=rst_sub(binq,qcf,delta0,1);
else
   sbr=zeros(1,length(n));
end

len=length(sbr)/3;
subr=coef_scan3d_inv(sbr(1:len),n);
subr2=coef_scan3d_inv(sbr(len+1:len+len),n);
subr3=coef_scan3d_inv(sbr(len+len+1:len+len+len),n);
