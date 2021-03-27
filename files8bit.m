%infile='BasketballDrive_1920x1080_50.yuv'; fid=fopen(infile);
%infile='BQTerrace_1920x1080_60.yuv'; fid=fopen(infile); %601 frames
infile='Cactus_1920x1080_50.yuv'; fid=fopen(infile); %500 frames
%infile='Kimono1_1920x1080_24.yuv'; fid=fopen(infile);


L1=1080; L2=1920; hL1=L1/2; hL2=L2/2;

a=uint8(zeros(L1,L2,300)); fm=0; frame=1;
for ia=frame:16
   fseek(fid,(ia-1)*L2*L1*1.5,'bof');    Y=fread(fid, [L2,L1],'uint8')';
   u=fread(fid, [hL2,hL1],'uint8')';
   v=fread(fid, [hL2,hL1],'uint8')';
   fm=fm+1;
   a(:,:,fm)=Y;
end
%whos Y u v
fclose(fid);

%imwrite(a(:,:,1),'Kimono1_bw.bmp');
%save BQTerrace_8bit_frame500 Y u v

U=zeros(L1,L2); V=U;
U(1:hL1,1:2:L2)=u; U(1:hL1,2:2:L2)=u; u=U(1:hL1,:);
U(1:2:L1,:)=u; U(2:2:L1,:)=u; 
V(1:hL1,1:2:L2)=v; V(1:hL1,2:2:L2)=v; v=V(1:hL1,:);
V(1:2:L1,:)=v; V(2:2:L1,:)=v; 

B = 1.164*(Y - 16)                   + 2.018*(U - 128);
G = 1.164*(Y - 16) - 0.813*(V - 128) - 0.391*(U - 128);
R = 1.164*(Y - 16) + 1.596*(V - 128);


img=uint8(zeros(L1,L2,3));
img(:,:,1)=R; img(:,:,2)=G; img(:,:,3)=B;

%imwrite(img,'Kimono1_8bit.bmp');


infile='test.yuv'; fid=fopen(infile); %output files from HEVC codec
%infile='rec1.yuv'; fid=fopen(infile); %output files from HEVC codec
yr=fread(fid, [L2,L1],'uint16')';
fclose(fid);

yr=yr/4;

e=Y-yr;
e=sqrt(sum(sum(e.*e))/(1080*1920));
PSNR=20*log10(255/e)

