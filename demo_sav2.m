11111
%************************************ѹ����ʼ***********************************
[ a, h, w ] = pfmread_op('memorial_o876.pfm');
sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=10000^(1/511);
delta = 2; 
f = 0.2;
nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMOɫ��ӳ�䲿��----------------------------------%
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
maxm=max(max(max(a)));
hdr255=a./maxm.*255.0;
hdr=zeros(h,w,3); ldr=zeros(h,w,3);
bitlen=0;
for ia=1:3
      [ img ] = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm ); %imΪɫ��ӳ����ͼ��
      im(:,:,ia)=img;
      maximg(ia)=max(max(img));
      [ ldri(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
end
%----------------------------------��ɫ�ռ�ת��--------------------------------------------% 
yuv=RGB2YUV(im);
%----------------------------------��ʼ����--------------------------------------------%    
for ia=1:3
      img=yuv(:,:,ia);
      fprintf('\n Compression starts. Performing transform on the image ...\n');
      M=8; lev=3; [coef,fL]=LFP2(img,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      binary=en_coef2D_new(coef,delta); binary=[nn binary];
      N=size(binary); bitlen=bitlen+N(2);
      outfile='endata';
      fsz=binOut([outfile,num2str(ia)],binary);
      %��im���ɵ�hdr��ldr��������������psnr��
      %���ϣ��psnr�������ȷ��Ҳ������ǰ���hdr255��ldri�����㡣
      [ hdr(:,:,ia), ldr(:,:,ia) ] = tmo2_mod2( im(:,:,ia), f, lav, m, maxm);
end
bpp=bitlen/(h*w*3); %����bpp

%************************************��ѹ��ʼ***********************************
filename='endata';
fprintf('\n  Reading the file ...');
img2=zeros(h,w,3);
hdrR=zeros(h,w,3); ldrR=zeros(h,w,3);
for ia=1:3
    bin=binIn([filename,num2str(ia)]); 
    nn=bin(1:9); bin=bin(10:length(bin)); 
    nn=char(nn+48); nn=double(bin2dec(nn)); 
    inc=10000^(1/511); delta=0.01*inc^nn;
 %========================��ʼ����==========================
    fprintf('\n Decoding starts ... \n');
    coef=de_coef2D_new(bin,delta);
    fprintf('Performing the Inverse Transform ... \n');
    M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
%     qb(qb>maximg(ia))=maximg(ia);
%     qb(qb<0)=0;
    img2(:,:,ia)=qb;
end
%--------------------��ɫ�ռ�ת��-------------------------------------
rgb=YUV2RGB(img2);
for ia=1:3
%--------------------����ɫ��ӳ��ITMO-------------------------------------
    rgb(rgb>maximg(ia))=maximg(ia);
    rgb(rgb<0)=0;
    [ hdrR(:,:,ia), ldrR(:,:,ia) ] = tmo2_mod2( rgb(:,:,ia), f, lav, m, maxm );
end
%������hdr_psnr�ǱȽ�psnr(hdr0,hdr)����psnr(hdr0,hdr255);
%ͬ������ldr_psnr�ǱȽ�psnr(ldr0,ldr)����psnr(ldr0,ldri);
%bpp�Ѽ��������������Ϊcpp�ı����У�
psnr_hdr=PSNR(hdrR,hdr255); 
psnr_ldr=PSNR(ldrR,ldr);
fprintf('BPP = %f\n',bpp);

