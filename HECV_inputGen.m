%load CrowdRun_96frames

outfile='Crowd1024.yuv'; 
fid=fopen(outfile,'wb');
a=uint16(a);
b=uint16(zeros(512,512));
for ia=33:64
   fwrite(fid, a(:,:,ia), 'uint16');
   fwrite(fid, b, 'uint16');
   fwrite(fid, b, 'uint16');
end
fclose(fid);


