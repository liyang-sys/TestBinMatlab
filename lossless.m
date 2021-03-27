%infile='\SignifProp\bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
infile='\SignifProp\cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='\SignifProp\woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);

%5300D: ======================================================================================================
%a=double(imread('\image\DSC_0075acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0113acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0184acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0415acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0436acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0438acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0455acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0461acr2.tif'))/257; [a,u,v] = color2Y(a); 

%nikno850D ===================================================================================================
%a=double(imread('\image\DSC_0788.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0798.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_1390.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_2118.tif'))/257; [a,u,v] = color2Y(a);

%fuji =======================================================================================================
%a=double(imread('\image\DSCF0323.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF3485.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF5234.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF5253.tif'))/257; [a,u,v] = color2Y(a);

%x-ray ======================================================================================================
%a=double(imread('\image\med_xray1_896x768_12bit.png'))/16;
%xrays, 3 1536x1536 xrays: ---------------------------------------------
%a=double(imread('\image\med_xray2_1536x1536_12bit.png'))/16;
%a=double(imread('\image\med_xray3_1536x1536_12bit.png'))/16;
%a=double(imread('\image\med_xray4_1536x1536_12bit.png'))/16;
%xrays, 3 512x512 xrays: -----------------------------------------------
%a=double(imread('\image\med_xray5_512x512_8bit.png'))/16;
%a=double(imread('\image\med_xray6_512x512_12bit.png'))/16;
%a=double(imread('\image\med_xray7_512x512_12bit.png'))/16;
%-----------------------------------------------------------------------
%a=double(imread('\image\med_xray8_736x640_12bit.png'))/16;

%HD and UHD images =======================================================================================
%UHD images --------------------------------------------------------------
%a=imread('\image\4k_crowd07111.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\4k_oldtown01217.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\4k_ParkJoy15891.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\JT_Scarf_fm200.png');  a=double(a)/4;
%HD images ---------------------------------------------------------------
%a=imread('\image\Beauty.png');  a=double(a)/4;
%a=imread('\image\HoneyBee.png');  a=double(a)/4;
%a=imread('\image\Kimino_fm1.png');  a=double(a)/4; 
%a=imread('\image\Kimino_fm220.png');  a=double(a)/4;


a8bit=round(a);  a7bit=round(a/2); e7=(a7bit*2-a)*60+128;
N=size(a); Npix=numel(a);
delta=120;

%decomposition: ==================================================
%coef=dy79decm(a);
M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
coef=coef_reorder(coef); 

%entropy coding: =================================================

binary=en_coef2D_new(coef,delta);
coef=de_coef2D_new(binary,delta);
Nbit_lossy=length(binary);
rate_lossy_direct=Nbit_lossy/Npix %%%%%%%%%%%%%%%%%%%%%%%%%%%

%reconstruction: ================================================
%qb=dy79recon(coef);
coef=coef_reorder(coef);
coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv(coef,M,fL); %<==== LFP

e0=qb-a; e=e0.^2;             e0=e0*60 +128;
e=sqrt(sum(sum(e))/Npix);   SN0=20*log10(255/e);
fprintf('PSNR = %5.2f dB\n',SN0);

e8=a8bit-a; e=e8.^2;          e8=e8*60+128;
e=sqrt(sum(sum(e))/Npix);   SN8=20*log10(255/e);
fprintf('PSNR8bit = %5.2f dB\n',SN8);

%Extra for lossless (does not work): ====================================================
%eq=qbb-a8bit; eq=reshape(eq,1,Npix);
%sn=zeros(1,Npix); eq0=abs(eq); lensn=0;
%for ia=1:Npix
 %  if eq(ia)>0
  %    lensn=lensn+1;      sn(lensn)=1;
   %elseif eq(ia)<0
    %  lensn=lensn+1;
%   end
%end
%sn=sn(1:lensn);

%eq0=eq0+1; 
%maxeq0=max(eq0);
%bin=en_Kside(eq0,maxeq0,0);
%bin_ex=[bin sn];

%j2k lossless: ===========================================================================
imwrite(uint8(a8bit), '\image\lossless_8bit.jp2', 'Mode','lossless');
x8bit=dir('\image\lossless_8bit.jp2');
rate_j2k=x8bit.bytes*8/Npix %%%%%%%%%%%%%%%%%%%%%%%%%%

%r0=rate_lossy_direct/rate_j2k
r=(rate_lossy_direct-(SN0-SN8)/6.02)/rate_j2k
