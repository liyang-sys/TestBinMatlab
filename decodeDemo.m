filename='endata';
fprintf('\n  Reading the file ...');
bin=binIn(filename); 

nn=bin(1:9); bin=bin(10:length(bin)); 
nn=char(nn+48); nn=double(bin2dec(nn)); inc=200^(1/511); delta=0.5*inc^nn;

%=====================================================
fprintf('\n Decoding starts ... \n');
coef=de_coef2D_new(bin,delta);

fprintf('Performing the Inverse Transform ... \n');
M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
N=size(qb);
img2=qb;
for ia=1:N(1)
   for ib=1:N(2)
      if qb(ia,ib)>maximg
         qb(ia,ib)=maximg;
      elseif qb(ia,ib)<0
         qb(ia,ib)=0.0;
      end
   end
end

fprintf('\n Saving the decompressed file. The saved file is a 16-bit TIFF file\n');

%--------------------反向色调映射ITMO-------------------------------------
f = input('Enter the f: ','s'); f=str2double(f);
[ hdr0, ldr0 ] = tmo2_mod2( qb, f, lav, m, maxy );

