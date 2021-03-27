function a=transform_3d_cfp8C_inv(a)

a=double(a);

nn=size(a); nn=nn(1)*nn(2)*nn(3); nn3=nn/3;
ru2=sqrt(2);

%-------------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);
nbk=w; qbk=nbk/4;
tanTheta=1/8;

N2=1024; ftrL=CFPfilter8B'; w2=16;
fL=zeros(w2,N2);  tem1=ftrL(1:w2);   for ia=1:N2, fL(:,ia)=tem1; end

for ia=1:96
   ia %%%%%%%%%%%%%%%%%%%
   a(:,:,ia)=band2block_wholeLF(a(:,:,ia),8);   a(:,:,ia)=LFP2Inv(a(:,:,ia),8,fL);
end

clear fL

ftrL=CFPfilter4B'; w2=8;
fL4=zeros(w2,N2);  tem1=ftrL(1:w2);   for ia=1:N2, fL4(:,ia)=tem1; end

a=transform_time_domainB_inv(a,fL4);
a=single(a);
