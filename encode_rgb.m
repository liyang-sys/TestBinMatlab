[ a, h, w ] = pfmread_op('E:\程序代码\色调映射测试\pfm\memorial_o876.pfm');
%----------------------------------------------------------
sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=10000^(1/511);

   delta = input('Enter the quantization step size: ','s'); delta=str2double(delta);
   outfile='E:\程序代码\色调映射测试\测试数据\彩色图像\endata';
   nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
   nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMO色调映射部分----------------------------------%
    f = input('Enter the f: ','s'); f=str2double(f);
    [  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
    im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
    maxm=max(max(max(a)));
    hdr255=a./maxm.*255.0;
    for ia=1:3
        [ im(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, f, maxm );
        maximg(ia)=max(max(im(:,:,ia)));
        [ ldri(:,:,ia) ] = tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
    end
    
    hdr=zeros(h,w,3); ldr=zeros(h,w,3);
    bitlen=0;
    for ja=1:3
      img=im(:,:,ja);
%--------------------------------------------------------------------------------%
      fprintf('\n Compression starts. Performing transform on the image ...\n');
      M=8; lev=3; [coef,fL]=LFP2(img,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      binary=en_coef2D_new(coef,delta); binary=[nn binary];
      N=size(binary); bitlen=bitlen+N(2);

      fsz=binOut([outfile,num2str(ja)],binary);
      [ hdr(:,:,ja), ldr(:,:,ja) ] = tmo2_mod2( im(:,:,ja), f, lav, m, maxm);
    end
    
    