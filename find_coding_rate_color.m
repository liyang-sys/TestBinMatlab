%a=double(imread('\image\32images\Nikon_5300D1.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D3.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D4.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D5.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D6.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D7.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D8.tif'))/257; [y,u,v] = color2Y(a);

%nikno850D ===================================================================================================
%a=double(imread('\image\32images\Nikon_850D1.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D3.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D4.tif'))/257; [y,u,v] = color2Y(a);
%nikon HDR ---------------------------------------------------------------------------------------------------------------
a=double(imread('C:\image\images4HDR\nikon850D5.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('C:\image\images4HDR\nikon850D6.tif'))/257;  [y,u,v] = color2Y(a);

%fuji =======================================================================================================
%a=double(imread('\image\32images\Fuji1.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji2.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji3.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji4.tif'))/257;  [y,u,v] = color2Y(a);
%fuji HDR ---------------------------------------------------------------------------------------------------------------
%a=double(imread('C:\image\images4HDR\Fuji5.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('C:\image\images4HDR\Fuji6.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('C:\image\images4HDR\Fuji7.tif'))/257;  [y,u,v] = color2Y(a);


%HD and UHD images =============================================================================================
%UHD images -------------------------------------------------------------------------------------------------
%a=imread('\image\32images\UHD1.png');  a=double(a)/257;  [y,u,v]=color2Y(a);
%a=imread('\image\32images\UHD2.png');  a=double(a)/257;  [y,u,v]=color2Y(a);
%a=imread('\image\32images\UHD3.png');  a=double(a)/257;  [y,u,v]=color2Y(a);
%a=imread('\image\32images\UHD4.png');  a=double(a)/4;
%HD images --------------------------------------------------------------------------------------------------
%a=imread('\image\32images\HD1.png'); a=double(a)/4;   %a=imread('\image\Beauty.png');  a=double(a)/4;
%a=imread('\image\32images\HD2.png'); a=double(a)/4;   %a=imread('\image\HoneyBee.png');  a=double(a)/4;
%a=imread('\image\32images\HD3.png'); a=double(a)/4;   %a=imread('\image\Kimino_fm1.png');  a=double(a)/4; 
%a=imread('\image\32images\HD4.png'); a=double(a)/4;   %a=imread('\image\Kimino_fm220.png');  a=double(a)/4;



delta=2.5;
num=numel(y); N=size(y);
rate=1.407; fsz0=rate*num/8; er=0.0008*fsz0*1.5; fsz=fsz0-er/5;

f=1000000/255; 
lw=16.0000001; hg=235.00175; %<===============================
%-------------------------------------------------------------------------------------------------------------
M=8; lev=3; 
[coefy,fL]=LFP2(y,M);  tanTheta=1/8; coefy=block2bd(coefy,M,lev,tanTheta); 
111
[coefu,fL]=LFP2(u,M);  tanTheta=1/8; coefu=block2bd(coefu,M,lev,tanTheta);
222
[coefv,fL]=LFP2(v,M);  tanTheta=1/8; coefv=block2bd(coefv,M,lev,tanTheta);
%coefy=coef_reorder(coefy); coefu=coef_reorder(coefu); coefv=coef_reorder(coefv);
333

fsize=0;
a=y; coef=coefy; test_en_coef1; fsize=fsize+file_size; SNy=SN; yr=qb;
a=u; coef=coefu; test_en_coef1; fsize=fsize+file_size; SNu=SN; ur=qb;
a=v; coef=coefv; test_en_coef1; fsize=fsize+file_size; SNv=SN; vr=qb;
eer0=fsize-fsz 
delta0=delta;

if eer0<0
   delta=delta*(1-1/20); 
else
   delta=delta*(1+1/20); 
end
delta %%%%%%%%%%%%%%%%
fsize=0;
a=y; coef=coefy; test_en_coef1; fsize=fsize+file_size; SNy=SN; yr=qb;
a=u; coef=coefu; test_en_coef1; fsize=fsize+file_size; SNu=SN; ur=qb;
a=v; coef=coefv; test_en_coef1; fsize=fsize+file_size; SNv=SN; vr=qb;
eer=fsize-fsz 


while abs(eer)>er %&& abs(SN-SN0)>0.003
   delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta;
   delta0=delta; eer0=eer; SN0=SN;
   delta=delta2 %%%%%%%%%%%%%%%%%%%%

   fsize=0;
   a=y; coef=coefy; test_en_coef1; fsize=fsize+file_size; SNy=SN; yr=qb;
   a=u; coef=coefu; test_en_coef1; fsize=fsize+file_size; SNu=SN; ur=qb;
   a=v; coef=coefv; test_en_coef1; fsize=fsize+file_size; SNv=SN; vr=qb;
   eer=fsize-fsz 
   
   fprintf('--------------------------------------------------------------------------------------------------------------------\n\n')
end

fprintf('PSNR_Y = %6.3f dB, PSNR_U = %6.3f dB, PSNR_V = %6.3f dB, rate = %6.4f bpp,   delta =%6.2f \n',SNy,SNu,SNv,fsize*8/numel(qb), delta);
fprintf('PSNR_Y = %6.2f dB, PSNR_U = %6.2f dB, PSNR_V = %6.2f dB, rate = %6.4f bpp,   delta =%6.2f \n',SNy,SNu,SNv,fsize*8/numel(qb), delta);
fprintf('\n===================================================================================================================\n\n')

clear coef coefr coefy coefu coefv a qb


rgb=color2Yinv(yr,ur,vr);
%imwrite(uint8(round(rgb)), '\image\UHD2_color_proposed_QP29.tif');
%imwrite(uint8(round(rgb)), '\image\Fuji4_color_proposed_QP30.tif');
imwrite(uint16(round(rgb*257)), 'C:\image\images4HDR\nikon850D5_proposed_QP12.tif');
