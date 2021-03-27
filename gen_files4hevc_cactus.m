load Cactus_96frames

N=size(a); N=N(1:2); hN=N/2;

a=uint8(a);
u=uint8(zeros(hN));

outfile='Cactus1024_33to64.yuv';  fid2=fopen(outfile,'w');
for frame=33:64
   fwrite(fid2, a(:,:,frame)); fwrite(fid2, u); fwrite(fid2, u); 
end
fclose(fid2);


%check the file below: 
fid=fopen(outfile);
L1=N(1); L2=N(2); hL1=L1/2; hL2=L2/2;
ar=uint8(zeros(L1,L2,32)); 
for fm=1:32
   fseek(fid,(fm-1)*L2*L1*1.5,'bof');    Y=fread(fid, [L2,L1],'uint8')';
   ur=fread(fid, [hL2,hL1],'uint8')';
   vr=fread(fid, [hL2,hL1],'uint8')';
   ar(:,:,fm)=Y;
end
fclose(fid);


