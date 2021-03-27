%load Cactus_time_domain_26filter_transformed
%load ParkScene_time_domain_26filter_transformed
load Kimono_time_domain_26filter_transformed
a=double(a);

%-----------------------------------------------------------------------
M=4;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/8;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M);   a(:,:,ia)=block2band(a(:,:,ia),M,tanTheta);
end

for ia=1:12
   a(1:qbk(1),1:qbk(2),ia)=CFP2band(a(1:qbk(1),1:qbk(2),ia),tanTheta);
   a(1:qbk(1),1:qbk(2),ia)=block2LowHigh(a(1:qbk(1),1:qbk(2),ia));
end

a=single(a);
%save Cactus_cfp4_3d_transformed_5lev a
%save ParkScene_cfp4_3d_transformed_5lev a
save Kimono_cfp4_3d_transformed_5lev a


