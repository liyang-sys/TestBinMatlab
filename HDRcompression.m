function [hdrR,ldrR,hdr255,ldri,PSNRQ,PSNRq,bpp]=HDRcompression(a,f,delta,c2y)

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


if c2y,  
   %[Y,Cb,Cr] = color2Y(im);  im(:,:,1)=Y; im(:,:,2)=Cb; im(:,:,3)=Cr;
   
   Mcbr=[0.299 0.587 0.114;  -0.1687 -0.3313 0.5;  0.5 -0.4187 -0.0813];  %YCbCr
   A=[reshape(im(:,:,1),1,N);  reshape(im(:,:,2),1,N);  reshape(im(:,:,3),1,N)];   A=Mcbr*A;
   im(:,:,1)=reshape(A(1,:),h,w);  im(:,:,2)=reshape(A(2,:),h,w);  im(:,:,3)=reshape(A(3,:),h,w); 
end

%save YCbCr im

%code the image:  ===================================================================================================
filename='IMG.cmp';
fprintf(' Compression starts. Performing transform on the image ...\n');
en_color_img(im,delta,filename);

x=dir(filename);   bpp=x.bytes*8/N;

fprintf(' Decoding starts ... \n\n');
img2=de_color_img(filename);
%====================================================================================================================

if c2y,  
   %img2(img2>240)=240; img2(img2<16)=16;
   %Y=img2(:,:,1); Cb=img2(:,:,2); Cr=img2(:,:,3); img2=color2Yinv(Y,Cb,Cr); 
   
   A=[reshape(img2(:,:,1),1,N);  reshape(img2(:,:,2),1,N);  reshape(img2(:,:,3),1,N)];   A=Mcbr\A;
   img2(:,:,1)=reshape(A(1,:),h,w);  img2(:,:,2)=reshape(A(2,:),h,w);  img2(:,:,3)=reshape(A(3,:),h,w); 
end
img2(img2>255)=255; img2(img2<0)=0;

%--------------------反向色调映射ITMO-------------------------------------
hdrR=zeros(h,w,3); ldrR=zeros(h,w,3);
for ia=1:3
   [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( img2(:,:,ia), f, lav, m, maxm );
end
%最后计算hdr_psnr是比较psnr(hdr0,hdr)或者psnr(hdr0,hdr255);
%同样计算ldr_psnr是比较psnr(ldr0,ldr)或者psnr(ldr0,ldri);
%bpp已计算出来保存在名为cpp的变量中；

%whos hdrR hdr255 ldrR ldri

PSNRQ=psnr(hdrR/255,hdr255/255);   PSNRq=psnr(ldrR/255,ldri/255);


