%infile='DucksAndLegs_1920x1080_60_10bit_422.yuv'; fid=fopen(infile);
%infile='ParkScene_1920x1080_24_10bit_422.yuv'; fid=fopen(infile);
%infile='OldTownCross_1920x1080_50_10bit_422.yuv'; fid=fopen(infile);
infile='Kimono1_1920x1080_24_10bit_422.yuv'; fid=fopen(infile);
%infile='CrowdRun_1920x1080_50_10bit_422.yuv'; fid=fopen(infile);
%infile='Seeking_1920x1080_50_10bit_422.yuv'; fid=fopen(infile);
%infile='BirdsInCage_1920x1080_60_10bit_422.yuv'; fid=fopen(infile);


a=uint16(zeros(1080,1920,240)); fm=0;
%for ia=1:240
for ia=33+32:33+32
   fseek(fid,(ia-1)*1920*1080*4,'bof');    b=uint16(fread(fid, [1920,1080],'uint16'))';
   u=fread(fid, [960,1080],'uint16')'/4;
   v=fread(fid, [960,1080],'uint16')'/4;
   fm=fm+1;
   a(:,:,fm)=b;
end

fclose(fid);

Y=double(b)/4;
%save ParkScene_frame200 Y

U=zeros(1080,1920); V=U;
U(:,1:2:1920)=u; U(:,2:2:1920)=u;
V(:,1:2:1920)=v; V(:,2:2:1920)=v;

B = 1.164*(Y - 16)                   + 2.018*(U - 128);
G = 1.164*(Y - 16) - 0.813*(V - 128) - 0.391*(U - 128);
R = 1.164*(Y - 16) + 1.596*(V - 128);

img=uint8(zeros(1080,1920,3));
img(:,:,1)=R; img(:,:,2)=G; img(:,:,3)=B;

%imwrite(img,'DucksAndLegs.bmp');
