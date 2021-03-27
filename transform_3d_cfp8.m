function a=transform_3d_cfp8(a)

a=double(a);

a=transform_time_domain(a);

%-----------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:96
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M); a(:,:,ia)=block2band_5lev(a(:,:,ia),M,tanTheta);
end

for ia=1:12
   a(1:qbk(1),1:qbk(2),ia)=CFP2band(a(1:qbk(1),1:qbk(2),ia),tanTheta);
   a(1:qbk(1),1:qbk(2),ia)=block2LowHigh(a(1:qbk(1),1:qbk(2),ia));
end

a=single(a);
