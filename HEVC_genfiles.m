infile='lena512.bin'; fid=fopen(infile); a1=fread(fid,[512 512],'uint8'); fclose(fid);
infile='barbara.bin'; fid=fopen(infile); a2=fread(fid,[512 512],'uint8'); fclose(fid);
infile='goldhill.bin'; fid=fopen(infile); a3=fread(fid,[512 512],'uint8'); fclose(fid);
a4=imread('mandrill_corrected.bmp')';
a5=imread('boat.tif')';
a6=imread('zelda.tif')';

N=size(a1);

%uu=uint8(ones(256,256)*127);
uu=uint8(zeros(256,256));
u1=uu; v1=u1; a1=uint8(a1);
u2=uu; v2=u2; a2=uint8(a2);
u3=uu; v3=u3; a3=uint8(a3);
u4=uu; v4=u4; a4=uint8(a4);
u5=uu; v5=u5; a5=uint8(a5);
u6=uu; v6=u6; a6=uint8(a6);

outfile='images512.yuv';  fid2=fopen(outfile,'w');
fwrite(fid2, a1); fwrite(fid2, u1); fwrite(fid2, v1); 
fwrite(fid2, a2); fwrite(fid2, u2); fwrite(fid2, v2); 
fwrite(fid2, a3); fwrite(fid2, u3); fwrite(fid2, v3); 
fwrite(fid2, a4); fwrite(fid2, u4); fwrite(fid2, v4); 
fwrite(fid2, a5); fwrite(fid2, u5); fwrite(fid2, v5); 
fwrite(fid2, a6); fwrite(fid2, u6); fwrite(fid2, v6); 
fclose(fid2);


%check the file below: 
fid=fopen(outfile);
L1=N(1); L2=N(2); hL1=L1/2; hL2=L2/2;
a=uint8(zeros(L1,L2,300)); fm=0; frame=5;
for ia=frame:frame
   fseek(fid,(ia-1)*L2*L1*1.5,'bof');    Y=fread(fid, [L2,L1],'uint8')';
   u=fread(fid, [hL2,hL1],'uint8')';
   v=fread(fid, [hL2,hL1],'uint8')';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);


