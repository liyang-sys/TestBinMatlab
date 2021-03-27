%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

%load Kimono_cfp8_only;
%coef=single(cf_cfp8_only); clear cf_cfp8_only;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);
Ldc5=zeros(1024,1024,2); Ldc5(:,:,1)=Ldc; Ldc5(:,:,2)=L5;

L2a=coef(:,:,33:48);
wh=4;
w=128; nn=w*w*wh;


%delta0=5.99; %trim<=======================================================
%delta0=1.35*2; %trim<=======================================================
%delta0=2.99; %<=======================================================

%load H2ext
%load H3L3
%n=H3cutted(log2(wh),log2(w),n)'+1;   n=[n(2,:); n(3,:); n(1,:)];

[bin,Nbit]=temp(L3,wh,delta0);
%[bin,Nbit]=en_coef3d_cell(L3,wh,delta0);
%[bin,Nbit]=en_coef3dB_cell(L4,delta0);
%[bin,Nbit]=en_coef3d_dc5B_cell(Ldc,delta0,routxy);

%bin=en_coef3d(L2c,wh,delta0);
%bin=en_coef3dB(Ldc5,delta0);
%[bin]=en_coef3d_dc5(L5,delta0,routxy);
%[bin]=en_coef3d_dc5B(Ldc,delta0,routxy);
fprintf('\n------------------------------------------\n')


[Lev_sub,ptr]=de_coef3d_cell(bin,wh,delta0);
%[Lev_sub]=de_coef3dB_cell(bin,delta0);
%dc=1; [Lev_sub]=de_coef3d_dc5B_cell(bin,delta0,routxy,dc);


%ptr=1; [Lev_sub,ptr]=de_coef3d(bin,wh,delta0,ptr);
%ptr=1; [Lev_sub,ptr]=de_coef3dB(bin,delta0,ptr);
%ptr=1; dc=0; [Lev_sub,ptr]=de_coef3d_dc5(bin,delta0,routxy,dc,ptr);
%ptr=1; dc=1; [Lev_sub,ptr]=de_coef3d_dc5B(bin,delta0,routxy,dc,ptr);

%sub=L2c(1:32,1:32,:); subr=Lev_sub(1:32,1:32,:);
%sub=L2c(1:64,1:32,:); subr=Lev_sub(1:64,1:32,:);
%sub=L2c(1:64,1:64,:); subr=Lev_sub(1:64,1:64,:);
%sub=L2c(1:128,1:128,:); subr=Lev_sub(1:128,1:128,:);
%sub=L2c(1:128,:,:); subr=Lev_sub(1:128,:,:);
sub=L3; subr=Lev_sub;

e=double(sub(33:1024,:,:))-double(subr(33:1024,:,:)); e=e.*e; e1=sum(sum(sum(e)));
%SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=double(sub(1:32,33:1024,:))-double(subr(1:32,33:1024,:)); e=e.*e;  e2=sum(sum(sum(e)));
SNR=20*log10(256/sqrt((e1+e2)/(numel(sub)-32*32*16))) %%%%%%%%%%%%%%%%%%

bitrate=Nbit/numel(sub) %%%%%%%%%%%%


%subrdum = en_coef3d_dum(sub,wh,delta0);
%subrdum = en_coef3dB_dum(sub,delta0);
%[subrdum] = en_coef3d_dc5B_dum(sub,delta0,routxy);
%e=double(sub)-double(subrdum); e=e.*e; e=sqrt(sum(sum(sum(e)))/numel(sub));
%SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
