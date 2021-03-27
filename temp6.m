outfile='rec_intra.yuv'; 
bitdepth='uint16'; byte=2;
%bitdepth='uint8'; byte=1;
H=1024; W=H;
frame=1;


fid=fopen(outfile);
a=uint16(zeros(H,W,frame)); fm=0;
for ia=1:frame
   fseek(fid,(ia-1)*W*H*1.5*byte,'bof');    Y=fread(fid, [W,H], bitdepth)';
   u=fread(fid, [W,H]/2, bitdepth)';
   v=fread(fid, [W,H]/2, bitdepth)';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);
