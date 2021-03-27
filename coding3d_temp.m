%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);

%------------------------------------------------------------------
w=128; nn=128*128*8;
load Threshold
Tarr=T;


%r=6; c=7;  %Old T=5 <=== very random zz!!!
%r=5; c=3;  %Kimono, Park, T=5 <=== not random zz!!!
%r=5; c=3;  %Cactus T=5 <=== slightly random
%r=5; c=7;  %BQ T=5 <=== not random zz
%r=5; c=7;  %Cactus T=5 <=== slightly random


r=8; c=8; %T=2, BQ
r=7; c=7; %T=2, BQ
r=6; c=6;  %BQ del=2, L2c <===== on study 30/11/2014
%r=5; c=8; %
%r=2; c=5; %T=2 Cactus Jan 14, 15 
%r=5; c=3;  %crowdrun delta=2, Dec 14, and Kimono
%r=1; c=5; 
%r=3; c=2;  %
%r=1; c=2; %<===== Jan 10, 15 






row_col=[r c] %<==================================================
sub = double(L2c( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));

load H3L3
n=H3cutted(3,7,n)'+1;
n=[n(2,:); n(3,:); n(1,:)];

delta=19; %<=======================================================
%delta=12; %<=======================================================
delta=9; %<=======================================================
%delta=7.5; %<=======================================================
%delta=6; %<=======================================================
delta=5; %<=======================================================
%delta=4; %<=======================================================
%delta=3.5; %<=======================================================
%delta=3; %<=======================================================
%delta=2.5; %<=======================================================
%delta=2; %<=======================================================
%delta=1.5; %<=======================================================
%delta=0.5; %<=======================================================
%delta=0.35; %<=======================================================

delta0=delta;
T=delta/10; delt=delta/10;
qcf=quanTHD(sub,T,delt);
%zn=sign(abs(qcf)); figure; imshow(1-zn(:,:,1)) %%%%%%%%%%%%%%%%%

subr=rstTHDctr1(qcf,T,delt,0.42*delt,0.46*delt);
e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR0=20*log10(256/e)

[cf0,abssb,sb,sn_z,z,sn,cf10]=coef_scan3d(sub,qcf,n);
z0=z;

cf0=double(cf0);
nc=hist(cf0+1,[1:max(cf0+1)]);
figure; plot(nc/nc(1)); hold on; plot(nc/nc(1),'r.');  axis([0 25 0 1.1]); grid
%figure; plot(nc(2:26)./nc(1:25)); hold on; plot(nc(2:26)./nc(1:25),'r.'); axis([0 26 0.3 1]);

x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; xx=x(2:29)./x(1:28);
figure; plot(xx); hold on;  plot(xx,'r.');  axis([0 26 0.3 1]); grid
%figure; plot(x/2); hold on; plot(x/2,'r.');  axis([0 25 0 1.1*max(nc)]);
