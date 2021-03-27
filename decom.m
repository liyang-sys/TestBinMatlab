%medical images not used ------------------------------------------------------------
%a=readMRI(20)/16;
%a=read_float32('\medical_images\NCSU\ultrasound\echo0_circle400x400_float.ifs',4*127,[400 400],1);
%a0=read_uint16('\medical_images\NCSU\x_ray\brokenarm1200x1008_16.ifs',256*2,[1200 1008],1,1); a0=a0(1:512,129:640); a0=a0-1190; a0=a0/max(max(a0))*253; a=a0;
%------------------------------------------------------------------------------------

%for papers =========================================================================================
infile='\SignifProp\lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='\SignifProp\barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='\SignifProp\goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('\SignifProp\mandrill_corrected.bmp'));
%a=double(imread('\SignifProp\boat.tif'));
%a=double(imread('\SignifProp\zelda.tif'));

%infile='bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);   a=a(801:800+512, 801:800+512);
%infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%infile='woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%y0=1201; x0=501;   a=a(y0:y0+1023,x0:x0+1023);  imshow(a/255)



%load \SignifProp\ParkScene; x=890; y=1; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\CrowdRun;  x=690; y=1; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\Kimono1_10bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\SteamLocomotiveTrain_10bit;  x=1070; y=310; a=Y(y:y+1023,x:x+1023);

%load festival_fm56;  a=a/4; 
%load oldtown_fm33;  a=a/4; %There is a mistake: should be fm34! However, there should not be big differences
%load birds_fm33;  a=a/4; %There is a mistake: should be fm34! However, there should not be big differences
%load cactus_fm33;  %There is a mistake: should be fm34! However, there should not be big differences


%a=imread('N_boat_f1.png'); a=double(a)/4;
%a=imread('N_aerial_f1.png'); a=double(a)/4;
%a=imread('N_crosswalk_f1.png'); a=double(a)/4;
%a=imread('N_coaster_f300.png'); a=double(a)/4;
%a=imread('N_dinner_f900.png'); a=double(a)/4;
%a=imread('N_bar_f100.png'); a=double(a)/4;

%a=imread('4k_crowd07111.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_oldtown01217.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_InToTree05119.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_ParkJoy15891.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_duck13086.png');  a=double(a)/256; a=color2Y(a);

%a=imread('ultrasound03A.png'); a=double(a);
%a=imread('ultrasound02L.png'); a=double(a);


N=size(a);

%tanTheta=1/8; coef=CFPdyadic1(a,tanTheta);  %the PTV
%coef=dy79decm(a);

%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2band(coef,8,tanTheta); %<=====LFP for JPEG2000
M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%M=8; coef=dctM(a,M); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====DCT for SPIHT
%M=8; [coef,fL]=LFP2(a,M); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====LFP for SPIHT
%load thetaM; M=8; s=1; [coef,ap]=cos_ext(a,M,thetaM,s); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====cos_ext for SPIHT
%load thetaM_bior; M=8; s=S(M/2-1); [coef,ap]=cos_ext(a,M,thetaM_bior,s); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====cos_ext for SPIHT
%M=8; coef=dctM(a,M); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<===== SPIHT
%[coef,ap]=pre3_ext(a); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<===== SPIHT

%load slope_matrix
%coef = DeRe_using_matrix(a, Asin16e, Asin16e);
%coef3 = DeRe_using_matrix(a, Aiir16, Aiir16);
%coef5 = DeRe_using_matrix(a, Asin16d, Asin16d);
%coef6 = DeRe_using_matrix(a, Aperiod16, Aperiod16);
%coef7 = DeRe_using_matrix(a, Aperiod16, Asin16e);

%coef0 = dctM(a,16);
%M=16; [coefc,fL]=LFP2(a,M);
%coef = FFT_periodic_reverse_extension2D(a,16);
%coef1 = FFT_periodic_reverse_extension2D1(a,16);




%====================================================================================================
se=1;
%M=16; lev=2; [coef,fL]=LFP2(a,M); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP for JPEG2000
%M=16; lev=2; load thetaM_bior06; s=S(M/2-1); [coef,ap]=cos_ext(a,M,thetaM_bior,s); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====cos_ext for J2K
%M=16; lev=2; load thetaM; s=1; [coef,ap]=cos_ext(a,M,thetaM,s); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====cos_ext for J2K
%M=8; lev=3; [coef,fL]=LFP2(a,M); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP for JPEG2000
%M=8; lev=3; coef=dctM(a,M); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP for JPEG2000
%M=8; lev=3; load thetaM_bior07; s=S(M/2-1); [coef,ap]=cos_ext(a,M,thetaM_bior,s,se); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====cos_ext for J2K
%M=8; lev=3; load thetaM; s=1; [coef,ap]=cos_ext(a,M,thetaM,s); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====cos_ext for J2K
%M=4; lev=4; [coef,fL]=LFP2(a,M); tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP for JPEG2000

%M=8; lev=3; coef=cwp1dA(a,M)'; coef=cwp1dA(coef,M)'; tanTheta=1/8; coef=FurtherLevs(coef,M,lev,tanTheta); %cwp1dA for J2K
%M=8; lev=3; coef=cwp1dA(a,M)'; coef=cwp1dA(coef,M)'; tanTheta=1/8; coef=FurtherLevs(coef,M,lev,tanTheta); coef=wp2tree(coef,4,2,1); %cwp1dA for SPIHT
%M=16; lev=2; coef=cwp1dA(a,M)'; coef=cwp1dA(coef,M)'; tanTheta=1/8; coef=FurtherLevs(coef,M,lev,tanTheta); coef=wp2tree(coef,8,4,2); %cwp1dA for SPIHT

%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2band_4lev(coef,8,tanTheta); %<=====LFP for JPEG2000
%coef=dy79decm_5lev(a);
%coef=dy79decm_4lev(a);
%coef=dy79decm_3lev(a);
%coef=dy53decm(a);

%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2tree4bandC(coef,tanTheta); %<=====LFP for SPIHT
%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2band(coef,4,tanTheta); %<=====LFP for JPEG2000
%Ns=8; [coef,fL]=LFP2(a,Ns); tanTheta=1/8; coef=block2band_5lev(coef,Ns,tanTheta); %<=====LFP 5 lev


%[coef,hh,gg,hhh,ggg]=SWP2modified(a,16); %coef=wp2tree(coef,4,2,1); %The latest version of SWP

%fid=fopen('coefficient.dat','w'); fwrite(fid,coef,'float'); fclose(fid);
%=====================================================================================================


%[Nnon,zone0,subzone,sub]=Coef_Statistics(coef);
%[Nnon,zone0,subzone,sub]=Coef_Statistics_5lev(coef);

delta=30;
%T=delta; coef=quanTHD(coef,T,delta);

%[Nnon,zone0,subzone,subqcf]=Coef_Statistics(qcoef);
%[Nnon,zone0,subzone,subqcf]=Coef_Statistics_5lev(qcoef);
%[subqcoef]=subbands(qcoef,Ns);


%sz=size(sub{1,1});
%cf=rstTHDctr1(subqcf{1,1},T,delta,0.39*delta,0.46*delta);
%e=cf-sub{1,1}; e=e.^2; e=sqrt(sum(sum(e))/(sz(1)*sz(2)));
%SN=20*log10(255/e)


%----------------------------------------------------------------------------------
%cf0=abs(reshape(subqcf{1,1},1,256*256)); cf0=double(cf0);
%nc=hist(cf0+1,[1:max(cf0+1)]);
%figure; plot(nc/nc(1)); hold on; plot(nc/nc(1),'r.');  axis([0 25 0 1.1]); grid

%x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
%x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; xx=x(2:29)./x(1:28);
%figure; plot(xx); hold on;  plot(xx,'r.');  axis([0 26 0.3 1]); grid
%----------------------------------------------------------------------------------



%NnonTotal=sum(sum(zone0))
%figure; imshow(1-double(zone0))

%[Nnonf,zone0f,subzonef,subcoeff]=Coef_Statistics(qcoef);


%b=uint8(round(a));
%imwrite(b, 'goldhill.jp2', 'Mode','lossless');
%imwrite(b, 'lena.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',2.1);
%imwrite(b, 'goldhill.png');
%qb=double(imread('lena.jp2'));
%e=qb-a;   e=e.^2;   e=sqrt(sum(sum(e))/(N(1)*N(2)));   SN=20*log10(255/e)

%imwrite(uint16(a*256), 'test.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',4.0);
%imwrite(uint8(a), 'test8.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',2.0);
