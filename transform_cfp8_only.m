function  [a,fL]=transform_cfp8_only(a)

%load Cactus_96frames
%load ParkScene_96frames; a=a/4;
%load Kimono_96frames; a=a/4;
%load CrowdRun_96frames; a=a/4;
%load BQRerrace_96frames;
%load OldTownCross_96frames; a=a/4;

maxA=max(max(max(a)));
a=double(a);
if maxA>1024
   a=a/16;
elseif maxA>256
   a=a/4;
end

max(max(max(a)))
%-----------------------------------------------------------------------
M=8;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M);   a(:,:,ia)=block2band_5lev(a(:,:,ia),M,tanTheta);
end
a=single(a);
