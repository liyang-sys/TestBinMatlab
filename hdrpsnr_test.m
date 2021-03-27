clc;

fid=fopen('E:\程序代码\色调映射测试\测试数据\DoubleToHalf.dat','r');
hdr=fread(fid,'uint16');
hdr=reshape(hdr,512,768);
hdr=hdr';
fclose(fid);

fid=fopen('E:\程序代码\色调映射测试\c++代码\DoubleToHalf\Release\DoubleToHalf.dat','r');
hdr2=fread(fid,'uint16');
hdr2=reshape(hdr2,512,768);
hdr2=hdr2';
fclose(fid);