%load Cactus_cfp8_3d_transformed_5lev; 
%load ParkScene_cfp8_3d_transformed_5lev;
%load Kimono_cfp8_3d_transformed_5lev;
%load CrowdRun_cfp8_3d_transformed_5lev;
%load BQRerrace_cfp8_3d_transformed_5lev;
load OldTownCross_cfp8_3d_transformed_5lev;


delta=2.1

qcoef=quanTHD(coef,delta,delta);

Ldc=qcoef(:,:,2);
L1=qcoef(:,:,5);
L2=qcoef(:,:,9:10);
L3=qcoef(:,:,17:20);
L4=qcoef(:,:,33:40);
L5=qcoef(:,:,65:80);

statistics_video(qcoef);
%clear qcoef




