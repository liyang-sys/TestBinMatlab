load BirdsInCage; x=510; y=57; a1=uint16(Y(y:y+1023,x:x+1023)*4)'; 
load ParkScene; x=890; y=1; a2=uint16(Y(y:y+1023,x:x+1023)*4)';
load CrowdRun;  x=690; y=1; a3=uint16(Y(y:y+1023,x:x+1023)*4)';
load Kimono1_10bit;  x=310; y=50; a4=uint16(Y(y:y+1023,x:x+1023)*4)';
load SteamLocomotiveTrain_10bit;  x=1070; y=310; a5=uint16(Y(y:y+1023,x:x+1023)*4)';
clear Y


N=size(a1);

uu=uint16(ones(512,512)*511);
u1=uu; v1=u1; 
u2=uu; v2=u2;
u3=uu; v3=u3;
u4=uu; v4=u4;
u5=uu; v5=u5;
u6=uu; v6=u6;

outfile='images1024_10bits.yuv';  fid2=fopen(outfile,'w');
fwrite(fid2, a1,'uint16'); fwrite(fid2, u1,'uint16'); fwrite(fid2, v1,'uint16'); 
fwrite(fid2, a2,'uint16'); fwrite(fid2, u2,'uint16'); fwrite(fid2, v2,'uint16'); 
fwrite(fid2, a3,'uint16'); fwrite(fid2, u3,'uint16'); fwrite(fid2, v3,'uint16'); 
fwrite(fid2, a4,'uint16'); fwrite(fid2, u4,'uint16'); fwrite(fid2, v4,'uint16'); 
fwrite(fid2, a5,'uint16'); fwrite(fid2, u5,'uint16'); fwrite(fid2, v5,'uint16'); 
fclose(fid2);

%check the file below: 
fid=fopen(outfile);
L1=N(1); L2=N(2); hL1=L1/2; hL2=L2/2;
a=uint16(zeros(L1,L2,300)); fm=0; frame=2;
for ia=frame:frame
   fseek(fid,(ia-1)*L2*L1*3,'bof');    Y=fread(fid, [L2,L1],'uint16')';
   u=fread(fid, [hL2,hL1],'uint16')';
   v=fread(fid, [hL2,hL1],'uint16')';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);


