clc;


%%%********************************读取dat文件,画出TMO曲线图***********************************%%%
% fid=fopen('F:\程序代码\色调映射测试\DAT\int\gry\DSC_0615_iso200_gry.dat','r');
% hdrtoldr1=fread(fid,'uint16');
% hdrtoldr1=hdrtoldr1';
% fclose(fid);

% title('6幅ppm灰度图片的TMO曲线'); xlabel('HDR(0~65535)'); ylabel('LDR(0~255)');
% legend({'DSC-0615-iso200', 'DSC-0788-iso64', 'DSC-0798-iso72', 'DSC-0987-iso64', 'DSCF0116', 'DSCF5412', 'linear'}, 'Location', 'SouthEast');


%%%****************************************ToneMapping***********************************%%%
% fid=fopen('E:\程序代码\色调映射测试\测试数据\DoubleToHalf.dat','r');
% hdri=fread(fid,'uint16');
% hdri=reshape(hdri,512,768);
% hdri=hdri';
% fclose(fid);

fid=fopen('E:\程序代码\色调映射测试\测试数据\rv.dat','r');
rv=fread(fid,'uint16');
rv=reshape(rv,512,768);
rv=rv';
fclose(fid);
fid=fopen('E:\程序代码\色调映射测试\测试数据\gv.dat','r');
gv=fread(fid,'uint16');
gv=reshape(gv,512,768);
gv=gv';
fclose(fid);
fid=fopen('E:\程序代码\色调映射测试\测试数据\bv.dat','r');
bv=fread(fid,'uint16');
bv=reshape(bv,512,768);
bv=bv';
fclose(fid);

fid1=fopen('E:\程序代码\色调映射测试\测试数据\hdr2ldr.dat','r');
hdrtoldr=fread(fid1,'uint16');
hdrtoldr=hdrtoldr';
fclose(fid1);

% fid1=fopen('E:\程序代码\色调映射测试\测试数据\ldr2hdr.dat','r');
% ldrtohdr=fread(fid1,'uint16');
% ldrtohdr=ldrtohdr';
% fclose(fid1);
% 
% fid1=fopen('E:\程序代码\色调映射测试\测试数据\flt.dat','r');
% flt=fread(fid1,'double');
% flt=flt';
% fclose(fid1);

% figure;
% plot(hdrtoldr(1:32768));


%%%----------------------------------------------------------------
[h,w,d]=size(rv);

rldr=zeros(h,w);
for ii=1:h
    for jj=1:w
            t=rv(ii,jj);
            v=hdrtoldr(t+1);
            rldr(ii,jj)=v;
    end
end
gldr=zeros(h,w);
for ii=1:h
    for jj=1:w
            t=gv(ii,jj);
            v=hdrtoldr(t+1);
            gldr(ii,jj)=v;
    end
end
bldr=zeros(h,w);
for ii=1:h
    for jj=1:w
            t=bv(ii,jj);
            v=hdrtoldr(t+1);
            bldr(ii,jj)=v;
    end
end

ldr=zeros(h,w,3);
ldr(:,:,1)=rldr;
ldr(:,:,2)=gldr;
ldr(:,:,3)=bldr;
ldr=uint8(ldr);

