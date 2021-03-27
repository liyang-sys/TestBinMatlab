function qb=de_color_img(filename)

binary=binIn(filename); 

nn=binary(1:9); ptr=10; 
nn=char(nn+48); nn=double(bin2dec(nn));
inc=100000^(1/511); delta=0.001*inc^nn;

[H0,ptr] = deSFcode(binary,1536,ptr); H0=int16(H0);
[W0,ptr] = deSFcode(binary,1536,ptr); W0=int16(W0);
Nsub=bitshift(int32(H0)*int32(W0),4);

qb=zeros(H0*8,W0*8,3);
M=8; lev=3; tanTheta=0.125; 
for ia=1:3
   fprintf('COLOR = %d\n',ia);
   [coef,ptr]=de_coef2D_new(binary,delta,H0,W0,Nsub,ptr); %ptr
   coef=bd2block(coef,M,lev,tanTheta); qb(:,:,ia)=LFP2Inv_with_fL(coef,M);
end
