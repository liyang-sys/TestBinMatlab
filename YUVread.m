x=zeros(1024,1024,32);
d1=zeros(512,512,32); d2=d1;


infile='crowd1024.yuv'; 
fid=fopen(infile);

for ia =1:32
   x(:,:,ia)=fread(fid,[1024 1024],'uint16')'; 
   d1(:,:,ia)=fread(fid,[1024 1024]/2,'uint16')'; 
   d2(:,:,ia)=fread(fid,[1024 1024]/2,'uint16')'; 
end

fclose(fid);
