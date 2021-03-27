%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);

w=128; nn=128*128*8;

r=5; c=7;



row_col=[r c] %<==================================================
sub = double(L2c( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
%------------------------------------------------------------------



delta0=5.99*1.2; %trim<=======================================================
%delta0=1.35*2; %trim<=======================================================
%delta0=2.99; %<=======================================================



load H3L3
n=H3cutted(3,7,n)'+1;
n=[n(2,:); n(3,:); n(1,:)];


[bin,qcf]=en_sub3d(sub,n,delta0);
ptr=1; [subr,ptr]=de_sub3d(bin,length(qcf),delta0,n,ptr);


e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/length(qcf));
SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%


