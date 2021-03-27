load Cactus_96frames

outfile='Cactus1024.yuv'; 
fid=fopen(outfile,'wb');
a=uint8(a);
b=uint8(zeros(512,512));
for ia=33:64
   fwrite(fid, a(:,:,ia), 'uint8');
   fwrite(fid, b, 'uint8');
   fwrite(fid, b, 'uint8');
end
fclose(fid);
