%clc;
%************************************Ñ¹Ëõ¿ªÊ¼***********************************
%[ a, h, w ] = pfmread_op('memorial_o876.pfm');  a=double(a);
a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%A=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a);  %Nsteps=1808
%A=hdrread('\HDRimage\HDRimages\dani_cathedral_oBBC.hdr');  a=double(a); %Nsteps=1147
%A=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); %Nsteps=1054
%A=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a); %Nstep=1740
%A=hdrread('\HDRimage\HDRimages\Spheron3_oBAC.hdr');  a=double(a); %Nstep=4160 %Very interesting picture! probably only needs the scaling curves to magnify certain areas!
%A=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a); %Nsteps=1785
%A=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a); %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a); %Nsteps=1425
%A=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a); %Nsteps=2063  %needs to be checked !!!

f=0;
q=2^(1/5)*ones(1,5);

%delta = 2 *cumprod([1 q]), N=length(delta);


%delta=sqrt(2)/32; N=length(delta);
delta=0.125; N=length(delta);
%delta=0.125*sqrt(2); N=length(delta);

PSNRQ=zeros(1,N); PSNRq=PSNRQ; bpp=PSNRQ;

c2y=1;
for ia=1:N
   del=delta(ia) %%%%%%%%%%%%%%%%%%%%%%%%
   [hdrR,ldrR,hdri,ldri,PSNRQ(ia),PSNRq(ia),bpp(ia)]=HDRcompression(a,f,del,c2y);
end

PSNRQ,PSNRq,bpp

%Rbpp=bpp(1)/bpp(end)


%coef=LFP2(a(:,:,ia),M); coef=block2bd(coef,M,lev,tanTheta);
%binary=en_coef2D_new(coef,H0,W0,delta,binary); %L=length(binary) %%%%%%%%%%%%%%%%
