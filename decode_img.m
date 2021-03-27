filename = input('Enter the compressed image file name for decoding: ','s');
fprintf('\n  Reading the file ...');
bin=binIn(filename); 
nn=bin(1:9); bin=bin(10:length(bin)); 
nn=char(nn+48); nn=double(bin2dec(nn)); inc=200^(1/511); delta=0.5*inc^nn;

fprintf('\nThe decoded image will be saved as a ".tif" file.');
fname = input('\nEnter the file name without extension for the decoded image: ','s');
fname=[fname '.tif'];

%=====================================================
fprintf('\n Decoding starts ... \n');
coef=de_coef2D_new(bin,delta);

fprintf('Performing the Inverse Transform ... \n');
M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
N=size(qb);
for ia=1:N(1)
   for ib=1:N(2)
      if qb(ia,ib)>255
         qb(ia,ib)=255;
      elseif qb(ia,ib)<0
         qb(ia,ib)=0;
      end
   end
end

fprintf('\n Saving the decompressed file. The saved file is a 16-bit TIFF file\n');
qb=uint16(round(qb*256)); imwrite(qb, fname);

%e=qb-a; e=e.^2; e=sqrt(sum(sum(e))/numel(qb));   PSNR=20*log10(255/e)
clear; clear global; close all; fprintf('\n\n');
