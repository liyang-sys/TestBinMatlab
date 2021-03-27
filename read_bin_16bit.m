function a=read_bin_16bit(infile)

fid=fopen(infile); 

a=uint16(zeros(1024,1024,96));
for ia=1:96
   a(:,:,ia)=fread(fid,[1024,1024],'uint16');
end

fclose(fid);
