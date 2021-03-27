%load Cactus_96frames
load Cactus_96frames_cfp8


%a=a(:,:,1:48);
a=double(a);

a=shiftdim(a,2);
for x=1:1024
   %x
   for y=1:1024
    %  a(:,x,y)=dyadic_periodic_decom(a(:,x,y),5);
   end
end
a=shiftdim(a,1);

%-----------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:96
   a(1:nbk(1),1:nbk(2),ia)=CFP2band(a(1:nbk(1),1:nbk(2),ia),tanTheta);
   a(1:nbk(1),1:nbk(2),ia)=block2LowHigh(a(1:nbk(1),1:nbk(2),ia));
   a(1:hbk(1),1:hbk(2),ia)=CFP2band(a(1:hbk(1),1:hbk(2),ia),tanTheta);
   a(1:hbk(1),1:hbk(2),ia)=block2LowHigh(a(1:hbk(1),1:hbk(2),ia));
end

for ia=1:12
   a(1:qbk(1),1:qbk(2),ia)=CFP2band(a(1:qbk(1),1:qbk(2),ia),tanTheta);
   a(1:qbk(1),1:qbk(2),ia)=block2LowHigh(a(1:qbk(1),1:qbk(2),ia));
end

a=single(a);
%save Cactus_cfp8_3d_transformed_5lev a
