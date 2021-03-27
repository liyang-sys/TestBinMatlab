%a=read_bin_8bit('basketball.bin');
%a=read_bin_16bit('locomotive.bin'); a=double(a)/4;
%a=read_bin_16bit('traffic.bin'); a=double(a)/16;
%a=read_bin_16bit('duck.bin'); a=double(a)/4;
%a=read_bin_16bit('seeking.bin'); a=double(a)/4;
%a=read_bin_16bit('festival.bin'); a=double(a)/4;
%a=read_bin_8bit('basketball.bin');
%a=read_bin_8bit('peopleST.bin');
%a=read_bin_8bit('Johnny.bin');
%a=read_bin_8bit('FourPeople.bin');
%a=read_bin_8bit('Krist.bin');
%a=read_bin_8bit('BQMall.bin');

%[coef,fL4]=transform_3d_cfp8B(a);
%[coef,fL4]=transform_3d_cfp8B(a);


%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;
%load duck_cfp8_3d_transB_5lev;
%load seeking_cfp8_3d_transB_5lev;

%load basketball_cfp8_3d_transB_5lev; 

%load traffic_cfp8_3d_transB_5lev;
%load peopleST_cfp8_3d_transB_5lev;


Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);
Ldc5=zeros(1024,1024,2); Ldc5(:,:,1)=Ldc; Ldc5(:,:,2)=L5;


%Ldc=coef(:,:,33);  L5=coef(:,:,34);  L4=coef(:,:,35:36);  L3=coef(:,:,37:40);
%L2c=coef(:,:,41:48);  L2b=coef(:,:,49:56);  L2a=coef(:,:,57:64);


%delta0=3;
%delta0=5.99*0.65; %trim<=======================================================
%delta0=5.0*1.8; %trim<=======================================================

%[bin,qcoef_dum,Nbit]=en_video_full(delta0,coef);
%bitrate=Nbit/(1024*1024*32) %%%%%%%%%%%%%%%%%%%%%%
%qcoef=de_video_full(delta0,bin,qcoef_dum);



%bin=en_video(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc);
%[bn2a,bn2b,bn2c,bn3,bn4,bn5,bndc,Nbit]=en_video_cell(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc);
[bin,Nbit]=en_video_cell(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc);


%bitrate=length(bin)/(1024*1024*32) %%%%%%%%%%%%%%%%%%%%%%
bitrate=Nbit/(1024*1024*32) %%%%%%%%%%%%%%%%%%%%%%

%ptr=1; [L2ar,L2br,L2cr,L3r,L4r,L5r,Ldcr]=de_video(bin,delta0,ptr);
%[L2ar,L2br,L2cr,L3r,L4r,L5r,Ldcr]=de_video_cell(delta0,bn2a,bn2b,bn2c,bn3,bn4,bn5,bndc);
qcoef=de_video_cell(delta0,bin);



e=double(L2a)-double(qcoef{1}); e=e.*e; e2a=sum(sum(sum(e))); e=sqrt(e2a/numel(L2a)); SNR2a=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(L2b)-double(qcoef{2}); e=e.*e; e2b=sum(sum(sum(e))); e=sqrt(e2b/numel(L2b)); SNR2b=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(L2c)-double(qcoef{3}); e=e.*e; e2c=sum(sum(sum(e))); e=sqrt(e2c/numel(L2c)); SNR2c=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(L3)-double(qcoef{4}); e=e.*e; e3=sum(sum(sum(e))); e=sqrt(e3/numel(L3)); SNR3=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(L4)-double(qcoef{5}); e=e.*e; e4=sum(sum(sum(e))); e=sqrt(e4/numel(L4)); SNR4=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(L5)-double(qcoef{6}); e=e.*e; e5=sum(sum(sum(e))); e=sqrt(e5/numel(L5)); SNR5=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(Ldc)-double(qcoef{7}); e=e.*e; edc=sum(sum(sum(e))); e=sqrt(edc/numel(Ldc)); SNRdc=20*log10(256/e) %%%%%%%%%%%%%%%%%%

N=1024*1024*32;
e = e2a +e2b +e2c +e3 +e4 +e5 +edc;  e=sqrt(e/N);
SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
bitrate %%%%%%%%%%%%%%%%%%

%bitrate=length(bin)/N %%%%%%%%%%%%
%bitrate=Nbit/N %%%%%%%%%%%%

%e=double(coef)-double(qcoef); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(coef)); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%

