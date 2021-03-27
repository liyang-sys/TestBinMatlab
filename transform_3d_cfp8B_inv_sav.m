function a=transform_3d_cfp8B_inv(a)

a=double(a);

%-------------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);
nbk=w; qbk=nbk/4;
tanTheta=1/8;

for ia=1:12
   a(1:qbk(1),1:qbk(2),ia)=LowHigh2block(a(1:qbk(1),1:qbk(2),ia));
   a(1:qbk(1),1:qbk(2),ia)=CFP2bandInv(a(1:qbk(1),1:qbk(2),ia),tanTheta);
end

%-------------------------------------------------------------------------
N2=1024; ftrL=CFPfilter4B'; w2=8;
fL4=zeros(w2,N2);  tem1=ftrL(1:w2);   for ia=1:N2, fL4(:,ia)=tem1; end
a=transform_time_domainB_inv(a,fL4);

%-------------------------------------------------------------------------
ftrL=CFPfilter8B'; w2=16;
fL=zeros(w2,N2);  tem1=ftrL(1:w2);   for ia=1:N2, fL(:,ia)=tem1; end
for ia=1:96
   ia %%%%%%%%%%%%%%%%%%%
   a(:,:,ia)=band2block_5lev(a(:,:,ia),8,tanTheta);   a(:,:,ia)=LFP2Inv(a(:,:,ia),8,fL);
end
clear fL

a=single(a);
