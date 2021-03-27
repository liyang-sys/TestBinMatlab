clc;
%************************************压缩开始***********************************
[ a, h, w ] = pfmread_op('memorial_o876.pfm');
sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=10000^(1/511);
delta = 0.5; 
f = 0.2;
nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMO色调映射部分----------------------------------%
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
maxm=max(max(max(a)));
hdr255=a./maxm.*255.0;
hdr=zeros(h,w,3); ldr=zeros(h,w,3);
bitlen=0;
for ia=1:3
      [ img ] = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm ); %im为色调映射后的图像
      im(:,:,ia)=img;
      maximg(ia)=max(max(img));
      [ ldri(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
end
%----------------------------------颜色空间转换--------------------------------------------% 
yuv=RGB2YUV(im);
%----------------------------------开始编码--------------------------------------------%    
for ia=1:3
      img=yuv(:,:,ia);
      fprintf('\n Compression starts. Performing transform on the image ...\n');
      M=8; lev=3; [coef,fL]=LFP2(img,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      binary=en_coef2D_new(coef,delta); binary=[nn binary];
      N=size(binary); bitlen=bitlen+N(2);
      outfile='endata';
      fsz=binOut([outfile,num2str(ia)],binary);
      %由im生成的hdr和ldr，可以用来计算psnr。
      %如果希望psnr计算更精确，也可以用前面的hdr255和ldri来计算。
      [ hdr(:,:,ia), ldr(:,:,ia) ] = tmo2_mod2( im(:,:,ia), f, lav, m, maxm);
end
bpp=bitlen/(h*w*3); %计算bpp

%************************************解压开始***********************************
filename='endata';
fprintf('\n  Reading the file ...');
img2=zeros(h,w,3);
hdrR=zeros(h,w,3); ldrR=zeros(h,w,3);
for ia=1:3
    bin=binIn([filename,num2str(ia)]); 
    nn=bin(1:9); bin=bin(10:length(bin)); 
    nn=char(nn+48); nn=double(bin2dec(nn)); 
    inc=10000^(1/511); delta=0.01*inc^nn;
 %========================开始解码==========================
    fprintf('\n Decoding starts ... \n');
    coef=de_coef2D_new(bin,delta);
    fprintf('Performing the Inverse Transform ... \n');
    M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
%     qb(qb>maximg(ia))=maximg(ia);
%     qb(qb<0)=0;
    img2(:,:,ia)=qb;
end
%--------------------颜色空间转换-------------------------------------
rgb=YUV2RGB(img2);
for ia=1:3
%--------------------反向色调映射ITMO-------------------------------------
    rgb(rgb>maximg(ia))=maximg(ia);
    rgb(rgb<0)=0;
    [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( rgb(:,:,ia), f, lav, m, maxm );
end
%最后计算hdr_psnr是比较psnr(hdr0,hdr)或者psnr(hdr0,hdr255);
%同样计算ldr_psnr是比较psnr(ldr0,ldr)或者psnr(ldr0,ldri);
%bpp已计算出来保存在名为cpp的变量中；
psnr_hdr=PSNR(hdrR,hdr255); 
psnr_ldr=PSNR(ldrR,ldri);
fprintf('BPP = %f\n',bpp);

