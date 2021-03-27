a=zeros(H,W,3);
fseek(fid, offset, 'bof');
for ia=1:3
   a(:,:,ia)=fread(fid,[W H],'uint16')'; 
end
fclose(fid);
a=flipud(a);

if fp==1
   b8=256; a1=floor(a/b8); a2=a1*b8; a=(a-a2)*b8+a1; %some need it, some don't !!! Very odd.
end

%-------------------------------------------------------------------------------------------
%[y,cb,cr]=color2Y(a/16);
%ar=color2Yinv(y,cb,cr);

%imwrite(uint16(a),'4k_InToTree05119.png'); imwrite(uint8(floor(double(a)/256)),'4k_InToTree05119.jpg','quality',97)
%imwrite(uint16(a),'4k_oldtown01217.png'); imwrite(uint8(floor(double(a)/256)),'4k_oldtown01217.jpg','quality',97)
%imwrite(uint16(a),'4k_ParkJoy15891.png'); imwrite(uint8(floor(double(a)/256)),'4k_ParkJoy15891.jpg','quality',97)
%imwrite(uint16(a),'4k_duck13086.png'); imwrite(uint8(floor(double(a)/256)),'4k_duck13086.jpg','quality',97)

%imwrite(uint16(a),'traffic_fm1.png'); imwrite(uint8(round(a/16)),'traffic_fm1.bmp')

