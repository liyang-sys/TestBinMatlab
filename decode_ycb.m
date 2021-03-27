filename='E:\程序代码\色调映射测试\测试数据\彩色图像\endata';
fprintf('\n  Reading the file ...');

colorim=zeros(h,w,3);
for ia=1:3
    bin=binIn([filename,num2str(ia)]); 
    nn=bin(1:9); bin=bin(10:length(bin)); 
    nn=char(nn+48); nn=double(bin2dec(nn)); 
    inc=10000^(1/511); delta=0.01*inc^nn;

    %=====================================================
    fprintf('\n Decoding starts ... \n');
    coef=de_coef2D_new(bin,delta);

    fprintf('Performing the Inverse Transform ... \n');
    M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);
%     qb(qb>maximg(ia))=maximg(ia);
%     qb(qb<0)=0;
    colorim(:,:,ia)=qb;
end

img2=YUV2RGB(colorim);
% img2=YIQ2RGB(colorim);

%--------------------反向色调映射ITMO-------------------------------------
f = input('Enter the f: ','s'); f=str2double(f);
hdr0=zeros(h,w,3); ldr0=zeros(h,w,3);
for ja=1:3
    im2=img2(:,:,ja);
    im2(im2>maximg(ja))=maximg(ja);
    im2(im2<0)=0;
    [ hdr0(:,:,ja), ldr0(:,:,ja) ] = tmo2_mod2( im2, f, lav, m, maxm );
end
%-----------------------------------------------------------------------------


