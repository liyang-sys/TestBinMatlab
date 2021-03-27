function a=read_bin_8bit(infile)

%fid=fopen('Basketball.bin'); 
fid=fopen(infile); 

a=uint8(zeros(1024,1024,96));
for ia=1:96
   a(:,:,ia)=fread(fid,[1024,1024],'uint8');
end

fclose(fid);
