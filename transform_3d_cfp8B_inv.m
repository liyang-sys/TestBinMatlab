function a=transform_3d_cfp8B_inv(a,k)

%a=double(a);

%-------------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);

Lev=3; H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1 
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end

tanTheta=1/8; lev=2;

for ia=1:12
   a(1:H(3),1:W(3),ia)=LowHigh2block(a(1:H(3),1:W(3),ia));
   a(1:H(3),1:W(3),ia)=CFP2bdInv(a(1:H(3),1:W(3),ia),tanTheta);
end

%-------------------------------------------------------------------------
ftrL=CFPfilter4B'; w2=8;
fL4=zeros(w2,N(1));  tem1=ftrL(1:w2);   for ia=1:N(1), fL4(:,ia)=tem1; end
a=transform_time_domainB_inv(a,fL4,k);

%-------------------------------------------------------------------------
ftrL=CFPfilter8B'; w2=16;
fL=zeros(w2,N(2));  tem1=ftrL(1:w2);   for ia=1:N(2), fL(:,ia)=tem1; end
%for ia=33:64
for ia=1:96
   ia %%%%%%%%%%%%%%%%%%%
   a(:,:,ia)=bd2block(a(:,:,ia),8,lev,tanTheta);   a(:,:,ia)=LFP2Inv(a(:,:,ia),8,fL);
end
clear fL

a=single(a);
