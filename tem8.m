%function [hdrR,ldrR,hdr255,ldri,PSNRQ,PSNRq,bpp]=HDRcompression(a,f,delta,c2y)

a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%f=0.7; delta=16*64/64;
f=0.4, delta=4*2^(1/6); 


[h,w,d]=size(a); N=h*w;
%---------------------------TMO色调映射部分------------------------------------------------------------------
[lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
maxm=max(max(max(a)));
hdr255=a./maxm.*255.0; 

for ia=1:3
      [ img ] = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm ); %im为色调映射后的图像
      im(:,:,ia)=img;
      maximg(ia)=max(max(img));
      [ ldri(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
end
%-------------------------------------------------------------------------------------------------------------


%if c2y,  
   %[Y,Cb,Cr] = color2Y(im);  im(:,:,1)=Y; im(:,:,2)=Cb; im(:,:,3)=Cr;
   
   Mcbr=[0.299 0.587 0.114;  -0.1687 -0.3313 0.5;  0.5 -0.4187 -0.0813];  %YCbCr
   A=[reshape(im(:,:,1),1,N);  reshape(im(:,:,2),1,N);  reshape(im(:,:,3),1,N)];   A=Mcbr*A;
   im(:,:,1)=reshape(A(1,:),h,w);  im(:,:,2)=reshape(A(2,:),h,w);  im(:,:,3)=reshape(A(3,:),h,w); 
%end

%save YCbCr im

%code the image:  ===================================================================================================
filename='IMG.cmp';
fprintf(' Compression starts. Performing transform on the image ...\n');
%en_color_img(im,delta,filename);
idx=3;
M=8; lev=3;  tanTheta=1/8;   coef=LFP2(im(:,:,idx),M); coef=block2bd(coef,M,lev,tanTheta);


%binary=en_coef2D_new(coef,h/8,w/8,delta,[]); %L=length(binary) %%%%%%%%%%%%%%%%

hh=h/32; h=hh-bitshift(hh,-1); ww=w/32; w=ww-bitshift(ww,-1);
sub=[scanHilbert2D(coef(1:h,w+1:ww)) scanHilbert2D(coef(h+1:hh,w+1:ww)) scanHilbert2D(coef(h+1:hh,1:w))];
[bin,xx,qcf]=en_sub2d_new(sub,-1,delta);



%x=dir(filename);   bpp=x.bytes*8/N;
fprintf(' Decoding starts ... \n\n');


[r1,c1]=modify_Hilbert2D(h,ww-w); qsb1=zeros(h,ww-w); len1=length(r1);
[r2,c2]=modify_Hilbert2D(hh-h,ww-w); qsb2=zeros(hh-h,ww-w); len2=length(r2);
[r3,c3]=modify_Hilbert2D(hh-h,w); qsb3=zeros(hh-h,w); len3=length(r3);
[qsb,ptr]=de_sub2d(bin,0,0,delta,[r1 r2 r3],1);


%[cf,ptr]=de_coef2D_new(binary,delta,h/8,w/8,numel(coef),1);
%cf=bd2block(cf,M,lev,tanTheta); qb=LFP2Inv_with_fL(cf,M);


%img2=de_color_img(filename);
%====================================================================================================================

psnr(im(:,:,idx)/255, qb/255)


