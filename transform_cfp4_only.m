function  [a,fL]=transform_cfp4_only(a)

maxA=max(max(max(a)));
a=double(a);
if maxA>1024
   a=a/16;
elseif maxA>256
   a=a/4;
end

max(max(max(a)))
%-----------------------------------------------------------------------
M=4;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M);   a(:,:,ia)=block2band(a(:,:,ia),M,tanTheta);
end

a=single(a);

