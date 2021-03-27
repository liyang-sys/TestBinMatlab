function [a,fL4]=transform_3d_cfp8C(a)

a=double(a);

[a,fL4]=transform_time_domainB(a);

%-----------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M); a(:,:,ia)=block2band_wholeLF(a(:,:,ia),M);
end

a=single(a);
