%clc;
%************************************Ñ¹Ëõ¿ªÊ¼***********************************
%[ a, h, w ] = pfmread_op('memorial_o876.pfm');  a=double(a);
%a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\rend05_o87A.hdr');  a=double(a); a=a(1:704,:,:);
%A=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a);  %Nsteps=1808
%A=hdrread('\HDRimage\HDRimages\dani_cathedral_oBBC.hdr');  a=double(a); %Nsteps=1147
%A=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); %Nsteps=1054
%A=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a); %Nstep=1740
%A=hdrread('\HDRimage\HDRimages\Spheron3_oBAC.hdr');  a=double(a); %Nstep=4160 %Very interesting picture! probably only needs the scaling curves to magnify certain areas!
%A=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a); %Nsteps=1785
%A=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a); %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a); %Nsteps=1425
%A=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a); %Nsteps=2063  %needs to be checked !!!

%====================================================================================================================
%a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\rend05_o87A.hdr');  a=double(a); a=a(1:704,:,:);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a); a=a(1:768,1:1024,:);  %Nsteps=1808
%a=pfmread('C:\HDRimage\selected_test_images\dani_synagogue.pfm');  a=double(a); %a=a(1:768,1:1024,:); %Nsteps=1054
a=pfmread('C:\HDRimage\selected_test_images\SpheronPriceWestern.pfm');  a=double(a); %a=a(1:768,1:1024,:); %Nsteps=1054
%a=pfmread('C:\HDRimage\selected_test_images\MtTamWest.pfm');  a=double(a);  %a=a(15:15+703,32:32+1151,:); %Nstep=1740
%a=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a);  a=a(9:9+2111,9:9+3007,:); %Nsteps=1785
%a=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a);  a=a(7:7+1151,19:19+2943,:); x=max(max(max(a))); a(a>0.09*x)=0.001*x;  %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a);  a=a(:,5:5+3263,:); x=max(max(max(a))); a(a>0.6*x)=0.5*x; %Nsteps=1425
%a=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a);  a=a(5:5+895,17:17+895,:); %Nsteps=2063  %needs to be checked !!!

%a=double(pfmread('C:\HDRimage\selected_test_images\Tree.pfm'));



c2y=1; 

ff=0.9; del=28;
[hdrR,ldrR,hdri,ldri,PSNRQ,PSNRq,bpp]=HDRcompression(a,ff,del,c2y);
[PSNRQ,PSNRq,bpp]
