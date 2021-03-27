%clc;
%************************************压缩开始***********************************
[ a, h, w ] = pfmread_op('memorial_o876.pfm');  a=double(a);





sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=10000^(1/511);
%delta = input('Enter the quantization step size: ','s'); delta=str2double(delta);
delta=2;
nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMO色调映射部分----------------------------------%
%f = input('Enter the f: ','s'); f=str2double(f);
f=0.2;
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
maxm=max(max(max(a)));
hdr255=a./maxm.*255.0;  hdr0=hdr255;


hdr=zeros(h,w,3); ldr=zeros(h,w,3);
bitlen=0;
for ia=1:3
      [ img ] = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm ); %im为色调映射后的图像
      im(:,:,ia)=img;
      maximg(ia)=max(max(img));
      [ ldri(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
end


[Y,Cb,Cr] = color2Y(im);  im(:,:,1)=Y; im(:,:,2)=Cb; im(:,:,3)=Cr;
%mx1=max(max(max(im))), mn1=min(min(min(im)))



%----------------------------------开始编码--------------------------------------------%
fprintf('\n Compression starts. Performing transform on the image ...\n');
for ia=1:3
      %M=8; lev=3; [coef,fL]=LFP2(img,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      M=8; lev=3; [coef,fL]=LFP2(im(:,:,ia),M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      binary=en_coef2D_new(coef,delta); binary=[nn binary];
      bitlen=bitlen+length(binary);
      outfile='endata';
      fsz=binOut([outfile,num2str(ia)],binary);
      %由im生成的hdr和ldr，可以用来计算psnr。
      %如果希望psnr计算更精确，也可以用前面的hdr255和ldri来计算。
      %[ hdr(:,:,ia), ldr(:,:,ia) ] = tmo2_mod2( im(:,:,ia), f, lav, m, maxm);
end

bpp=bitlen/(h*w*3); %计算bpp


%************************************解压开始***********************************
filename='endata';
img2=zeros(h,w,3);
hdrR=zeros(h,w,3); ldrR=zeros(h,w,3);
fprintf('\n Decoding starts ... \n');
for ia=1:3
    bin=binIn([filename,num2str(ia)]); 
    nn=bin(1:9); bin=bin(10:length(bin)); 
    nn=char(nn+48); nn=double(bin2dec(nn)); 
    inc=10000^(1/511); delta=0.01*inc^nn;
    %========================开始解码==========================
    coef=de_coef2D_new(bin,delta);
    M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
    %qb(qb>maximg(ia))=maximg(ia);
    %qb(qb>255)=255;    qb(qb<0)=0;
    qb(qb>240)=240;    qb(qb<16)=16;
    img2(:,:,ia)=qb;
end



%mx2=max(max(max(img2))),mn2=min(min(min(img2)))

%whos img2
Y=img2(:,:,1); Cb=img2(:,:,2);  Cr=img2(:,:,3);  img2=color2Yinv(Y,Cb,Cr);
img2(img2>255)=255; img2(img2<0)=0;
%mx3=max(max(max(img2))), mn3=min(min(min(img2)))
%whos img2

%--------------------反向色调映射ITMO-------------------------------------
for ia=1:3
   [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( img2(:,:,ia), f, lav, m, maxm );
end
%最后计算hdr_psnr是比较psnr(hdr0,hdr)或者psnr(hdr0,hdr255);
%同样计算ldr_psnr是比较psnr(ldr0,ldr)或者psnr(ldr0,ldri);
%bpp已计算出来保存在名为cpp的变量中；

PSNRQ=psnr(hdrR/255,hdr255/255), PSNRq=psnr(ldrR/255,ldri/255)
bpp
f,delta