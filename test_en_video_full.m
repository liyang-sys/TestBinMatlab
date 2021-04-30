clear a ar

%a=read_bin_8bit('basketball.bin');
%a=read_bin_8bit('peopleST.bin');
%a=read_bin_16bit('seeking.bin'); a=double(a)/4;
%a=read_bin_16bit('traffic.bin'); a=double(a)/16;
%a=read_bin_8bit('Johnny.bin');
%a=read_bin_16bit('\signif\birds.bin'); a=single(a)/4; [h,w,d]=size(a);
%a=read_bin_16bit('Festival.bin'); a=single(a)/4;
%load cactus_96frames
%load BQTerrace_96frames
%load OldTownCross_96frames;  a=single(a)/4;
%load ParkScene_96frames; a=a/4;
%load \signif\Kimono_96frames; a=single(a)/4;
%maxa=max(max(max(a))); mina=min(min(min(a)));


h=1080; w=1920; f1=1; Nframe=96; fmt=422; bitdepth=8;
% h=2160; w=3840; f1=1; Nframe=96; fmt=420; bitdepth=10;
% a=double(read_yuv('BirdsInCage_1920x1080_60_8bit_422.yuv',h,w,f1,Nframe,fmt,bitdepth));

% a=double(read_yuv('\1080\BirdsInCage_1920x1080_60_10bit_422.yuv',h,w,f1,Nframe,fmt,bitdepth))/4;

k=0; %time-domain decom control: k=0: all subs - original design; k=1: 1:128; k=2: 1:256, see 'transform_time_domainB.m'
% a=single(a);
% coef=transform_3d_cfp8B(a,k); 
[coef]=readcoef('Video_Oldtown.dat','PTV_Oldtown.dat',h,w);
%Test results show that the time-domain control does not contribute to observable gain!
clear qcoef qcoef_dum;
%coef=transform_3d_cfp16(a); 

%load birds_cfp8_3d_transB_5lev;
%load Cactus_cfp8_3d_transB_5lev; 

% delta0=0.7; 
delta0=90;%trim<=======================================================
%==================================================
%²âÊÔ
% Lev_sub=coef(:,:,7:8);
% h=270; w=480; k0=1; hh=135; ww=240;
% n=modify_Hilbert3D(h,w,k0);  n7=modify_Hilbert3D(hh,ww,k0);
% r=1; c=2;
% sub = double(Lev_sub( 1:270, 481:960, :));
% len=numel(sub);  sb=zeros(1,len);
% for ia=1:len
%     if ia==32811
%         ia;
%     end
%    sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
% end

%     h=135; w=240;
%     Ldc=coef(:,:,2+1); Lev_sub=Ldc;
%     [t1,t2]=modify_Hilbert2D(135,240);   n=[t1;t2];
%     sub = double(Lev_sub( 1:135, 241:480, :));
%     %±àÂë
%     [bn,qcf]=en_sub3d_dc5(sub,n,delta0); 
%     %½âÂë--------------------------
%     nn=length(n);
%     [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,h,w,1); 
%==================================================



[bin,bin1,bin2,Nbit]=en_video_full(delta0,coef);
bitrate=Nbit/(numel(coef)/3) %%%%%%%%%%%%%%%%%%%%%%
%qcoef=de_video_full(delta0,bin,qcoef_dum);  qcoef=single(qcoef); clear qcoef_dum 

qcoef=de_video_full(delta0,bin,bin1,bin2,h,w);   qcoef=single(qcoef);

ar=transform_3d_cfp8B_inv(qcoef,k);
%ar0=transform_3d_cfp8C_inv(qcoef);
%ar0=transform_3d_cfp16_inv(qcoef);
clear qcoef

%ar=round(ar0*4)/4;
%ar=round(ar0*16)/16;
%maxa=255; mina=0;
%for ia=1:1024
 %  ia
  % for ib=1:1024
   %   for ic=33:64
    %     if ar(ia,ib,ic)>maxa, ar(ia,ib,ic)=maxa; end 
     %    if ar(ia,ib,ic)<mina, ar(ia,ib,ic)=mina; end 
      %end
%   end
%end
%e=double(a(:,:,33:64))-double(ar(:,:,33:64)); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a(:,:,33:64))); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%


%a=read_bin_16bit('\signif\birds.bin'); a=(single(a)/4);
%a=read_bin_16bit('Festival.bin'); a=single(a)/4;
%load cactus_96frames;  a=single(a);
%load OldTownCross_96frames;  a=single(a)/4;
%load \signif\Kimono_96frames; a=single(a)/4;
%load ParkScene_96frames; a=single(a)/4;

snr=zeros(1,96); Npix=h*w;
% for ia=1:96
%    fm=ia;
%    e=double(a(:,:,fm))-double(ar(:,:,fm)); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/Npix); snr(ia)=20*log10(255/e); %%%%%%%%%%%%%%%%%%
% end
[mean(snr) min(snr)]
