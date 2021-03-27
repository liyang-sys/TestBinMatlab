function [a,fL4]=transform_3d_cfp8B(a,k)

a=double(a);

%-----------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  

Lev=3; H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end

tanTheta=1/8; lev=2;
for ia=1:96
   ia
   a(:,:,ia)=LFP2(a(:,:,ia),M); a(:,:,ia)=block2bd(a(:,:,ia),M,lev,tanTheta);
end

%-----------------------------------------------------------------------
[a,fL4]=transform_time_domainB(a,k);

%-----------------------------------------------------------------------
for ia=1:12
   a(1:H(3),1:W(3),ia)=CFP2bd(a(1:H(3),1:W(3),ia),tanTheta);
   a(1:H(3),1:W(3),ia)=block2LowHigh(a(1:H(3),1:W(3),ia));
end

%-----------------------------------------------------------------------
a=single(a);
