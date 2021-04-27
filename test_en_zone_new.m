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

fileID = fopen('Nc.txt');
nc= fread(fileID,'uint32');
nc=nc';
fclose(fileID);
bin=en_zone_new(r,[],nc);