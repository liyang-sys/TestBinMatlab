clc;

fid=fopen('E:\�������\ɫ��ӳ�����\��������\DoubleToHalf.dat','r');
hdr=fread(fid,'uint16');
hdr=reshape(hdr,512,768);
hdr=hdr';
fclose(fid);

fid=fopen('E:\�������\ɫ��ӳ�����\c++����\DoubleToHalf\Release\DoubleToHalf.dat','r');
hdr2=fread(fid,'uint16');
hdr2=reshape(hdr2,512,768);
hdr2=hdr2';
fclose(fid);