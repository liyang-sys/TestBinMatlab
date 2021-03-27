%infile='lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
infile='goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('mandrill.tif'));
%a=double(imread('mandrill_corrected.bmp'));
%a=double(imread('boat.tif'));
%a=double(imread('zelda.tif'));
%a=a(17:496,17:496);

%infile='bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);


tanTheta=1/8; Lev=6; M=4; 
coef=Pre2p_DCT4p(a);    coef=block2bd(coef,M,Lev,tanTheta);
[coef1,fL]=LFP2(a,M);   coef1=block2bd(coef1,M,Lev,tanTheta);
coef2=dctM(a,M);      coef2=block2bd(coef2,M,Lev,tanTheta);


delta=8; T=0.9*delta; 
qcoef=quanTHD(coef,T,delta);  qcoef1=quanTHD(coef1,T,delta);  qcoef2=quanTHD(coef2,T,delta);


[Nnon,zone0,subzone,subqcf]=Coef_Statistics(qcoef);
[Nnon1,zone01,subzone1,subqcf1]=Coef_Statistics(qcoef1);
[Nnon2,zone02,subzone2,subqcf2]=Coef_Statistics(qcoef2);
Nnon, Nnon1, Nnon2
