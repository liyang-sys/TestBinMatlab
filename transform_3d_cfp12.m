load Cactus_time_domain_26filter_transformed
a=double(a);

%-----------------------------------------------------------------------
M=12;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M); a(:,:,ia)=block2band_4lev(a(:,:,ia),M,tanTheta);
end

for ia=1:12
   a(1:qbk(1),1:qbk(2),ia)=CFP2band(a(1:qbk(1),1:qbk(2),ia),tanTheta);
   a(1:qbk(1),1:qbk(2),ia)=block2LowHigh(a(1:qbk(1),1:qbk(2),ia));
end

a=single(a);
%save Cactus_cfp8_3d_transformed_5lev a
