%load Cactus_cfp8_3d_transformed_5lev; load Cactus_96frames
%load ParkScene_cfp8_3d_transformed_5lev; load ParkScene_96frames; a=a/4;
%load Kimono_cfp8_3d_transformed_5lev; load Kimono_96frames; a=a/4;
%load CrowdRun_cfp8_3d_transformed_5lev; load CrowdRun_96frames; a=a/4;
%load BQTerrace_cfp8_3d_transformed_5lev;  load BQTerrace_96frames;
%load OldTownCross_cfp8_3d_transformed_5lev;   load OldTownCross_96frames; a=a/4;

%load Cactus_cfp8_3d_transB_5lev; load Cactus_96frames
%load ParkScene_cfp8_3d_transB_5lev; load ParkScene_96frames; a=a/4;
%load Kimono_cfp8_3d_transB_5lev; load Kimono_96frames; a=a/4;
load CrowdRun_cfp8_3d_transB_5lev; load CrowdRun_96frames; a=a/4;
%load BQTerrace_cfp8_3d_transB_5lev;  load BQTerrace_96frames;
%load OldTownCross_cfp8_3d_transB_5lev;   load OldTownCross_96frames; a=a/4;

coef=double(coef);

nn=size(coef); nn=nn(1)*nn(2)*nn(3); nn3=nn/3;
ru2=sqrt(2);

%delta=2.05 %snr=49.14; mx-mn=0.32 

%delta=2 %Park: snr=49.31; mx-mn=0.40; std=0.10; Kimo: snr=49.02; mx-mn=0.29; std=0.08;
   %CrowdRun: snr=49.92; mxmn=0.52; std=0.12;
%delta=4 %snr=43.12; mx-mn=0.28; Park: snr=43.88; mx-mn=0.35; std=0.11; Kimo: snr=44.65; mx-mn=0.28; std=0.06;
%delta=6 % snr=40.29; mx-mn=0.26; Park: snr=41.47; mx-mn=0.55; std=0.15; Kimo: snr=43.27; mx-mn=0.36; std=0.08;

%delta=2.2 %BQ:snr=49.55; mxmn=0.36; std=0.10;
%delta=2.1 %Old:snr=49.16; mxmn=0.35; std=0.10;


delta=5, T=0.7*delta


qcoef=quanTHD(coef,T,delta);

maxamp=max(max(max(abs(qcoef)))) %%%%%%%%%%%%%%%%%
Nnon=sum(sum(sum(abs(sign(qcoef))))) %%%%%%%%%%%%%%%%%%%
qcf=rstTHDctr1(qcoef,T,delta,0.45*delta,0.46*delta);

e=coef-qcf; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR0=20*log10(256/e)


%-------------------------------------------------------------------------

%ar=transform_3d_cfp8_inv(qcf);
ar=transform_3d_cfp8B_inv(qcf,fL);


e=a(:,:,33:64)-ar(:,:,33:64); e=e.*e; e=sqrt(sum(sum(sum(e)))/nn3);
SNR=20*log10(256/e)

snr=zeros(1,32);
for ia=33:64
   e=a(:,:,ia)-ar(:,:,ia); e=e.*e; e=sqrt(sum(sum(sum(e)))/(1024*1024));
   snr(ia-32)=20*log10(256/e);
end

maxmin=max(snr)-min(snr), 

%save Cactus_quantized_delta_2p05 qcoef snr
