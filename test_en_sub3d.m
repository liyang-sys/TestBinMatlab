%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);
Ldc5=zeros(1024,1024,2); Ldc5(:,:,1)=Ldc; Ldc5(:,:,2)=L5;


%r=5; c=7;



%wh=8; w=128; nn=w*w*wh;
%wh=2; w=16; nn=w*w*wh;
%r=8; c=7;


%wh=8; w=2^7; nn=w*w*wh;
%rc=[1 2; 2 2; 2 1];

%r=6; c=5;
%sub = double(L2b( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
%------------------------------------------------------------------


%delta0=5.99; %trim<=======================================================
%delta0=1.35*2; %trim<=======================================================
%delta0=2.99; %<=======================================================



load H2ext
%[bin,sb,xx]=en_sub3d_dc5(sub,routxy,delta0);
%[subr,ptr]=de_sub3d_dc5(bin,numel(sub),delta0,routxy,1);
%bitrate=length(bin)/numel(sub)
%e=sub-subr; e=sum(sum(sum(e.*e))); e=sqrt(e/numel(subr));SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%




px0=2;
load H3L2

n8=H3cutted(px0,8,n)'+1; 
n8=[n8(2,:); n8(3,:); n8(1,:)];

n7=H3cutted(px0,7,n)'+1;
n7=[n7(2,:); n7(3,:); n7(1,:)];

n6=H3cutted(px0,6,n)'+1;
n6=[n6(2,:); n6(3,:); n6(1,:)];

n5=H3cutted(px0,5,n)'+1;
n5=[n5(2,:); n5(3,:); n5(1,:)];

n4=H3cutted(px0,4,n)'+1;
n4=[n4(2,:); n4(3,:); n4(1,:)];


wh=4; w=2^7; nn=w*w*wh;
r=2; c=5;
sub = double(L3( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));

[bn,qcf]=en_sub3d(sub,n7,delta0); bitrate=length(bn)/numel(sub) %%%%%%%%%%   
[subr,ptr]=de_sub3d(bn,nn,delta0,n7,1); 


e=sub-subr; e=sum(sum(sum(e.*e))); e=sqrt(e/numel(subr));SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%


%[bin,tem,qcf]=en_sub3d3(sb{1},sb{2},sb{3},n,delta0);   bitrate=length(bin)/numel(sub)/3 %%%%%%%%%%
%ptr=1; [sbr1,sbr2,sbr3,ptr,xx]=de_sub3d3(bin,numel(sub),delta0,n,ptr);
%e=sb{1}-sbr1; e1=sum(sum(sum(e.*e))); e=sqrt(e1/numel(sbr1));SNR1=20*log10(256/e) %%%%%%%%%%%%%%%%%%
%e=sb{2}-sbr2; e2=sum(sum(sum(e.*e))); e=sqrt(e2/numel(sbr2)); SNR2=20*log10(256/e) %%%%%%%%%%%%%%%%%%
%e=sb{3}-sbr3; e3=sum(sum(sum(e.*e))); e=sqrt(e3/numel(sbr3)); SNR3=20*log10(256/e) %%%%%%%%%%%%%%%%%%
%e=sqrt((e1+e2+e3)/numel(sbr3)/3); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%

