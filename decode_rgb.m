filename='E:\程序代码\色调映射测试\测试数据\彩色图像\endata';
fprintf('\n  Reading the file ...');
f = input('\n Enter the f: ','s'); f=str2double(f);

img2=zeros(h,w,3);
hdr0=zeros(h,w,3); ldr0=zeros(h,w,3);
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
    qb(qb>maximg(ia))=maximg(ia);
    qb(qb<0)=0;
    img2(:,:,ia)=qb;
 %--------------------反向色调映射ITMO-------------------------------------
    [ hdr0(:,:,ia), ldr0(:,:,ia) ] = tmo2_mod2( img2(:,:,ia), f, lav, m, maxm );
end




