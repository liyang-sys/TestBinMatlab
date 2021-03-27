%load L5B
%load L5_park2p15
load L5_kimono4

w=128;
x=5; y=1;
sub = double(L5( (x-1)*w+1:x*w, (y-1)*w+1:y*w, :)); 
zn=abs(sign(sub));


[bin,cf0,z]=en_subband_L1_H3(sub);

length(bin) %%%%%%%%%%%%%%%%%%%%%
sub1=zeros(512,512);
xy=[1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4; 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4];
for ia=1:16
   x=xy(1,ia); y=xy(2,ia);
   sub1((x-1)*w+1:x*w, (y-1)*w+1:y*w) = sub(:,:,ia);
end

[bin1,cf0,z]=en_subband_L1(sub1);

length(bin1) %%%%%%%%%%%%%%%%%%%%%

length(bin)/length(bin1)
