clear;
% fileID = fopen('mNewR.txt');
% r= fread(fileID,'uint32');
% r=r';
% fclose(fileID);
% 
% fileID = fopen('mNewNc.txt');
% nc= fread(fileID,'uint32');
% nc=nc';
% fclose(fileID);

clear;
fileID = fopen('newR.txt');
r= fread(fileID,'uint32');
r=r';
fclose(fileID);

bin=en_zone_sub2(r,[]);
     fid=fopen('mbin.txt','w'); %д�ķ�ʽ���ļ����������ڣ������ļ�����
     fwrite(fid,uint8(bin),'uint8');
     fclose(fid);
     xxxx=1;