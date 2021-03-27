load CrowdRun_cfp8_3d_transB_5lev;
%load Cactus_cfp8_3d_transB_5lev; 
%load OldTownCross_cfp8_3d_transB_5lev;


%load cactus_q5



ar=transform_3d_cfp8B_inv(coef);



load CrowdRun_96frames
%load Cactus_96frames
%load OldTownCross_96frames

a=single(a/4);

%diff=max(max(max(abs(single(ar)-single(a)))))


e=a(:,:,33:64)-ar(:,:,33:64); e0=e; e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a(:,:,33:64))); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=a(:,:,1:32)-ar(:,:,1:32); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a(:,:,1:32))); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
e=a(:,:,65:96)-ar(:,:,65:96); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a(:,:,33:64))); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%

