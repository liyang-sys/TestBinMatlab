%clc;
%************************************Ñ¹Ëõ¿ªÊ¼***********************************
%a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\rend05_o87A.hdr');  a=double(a); a=a(1:704,:,:);  %Nsteps=2068

%a=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a); a=a(1:768,1:1024,:);  %Nsteps=1808
%a=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); a=a(1:768,1:1024,:); %Nsteps=1054

%a=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a);  a=a(15:15+703,32:32+1151,:); %Nstep=1740
a=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a);  a=a(9:9+2111,9:9+3007,:); %Nsteps=1785

%A=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a); %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a); %Nsteps=1425
%A=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a); %Nsteps=2063  %needs to be checked !!!




%f=0.000, delta=(1/8)*64/64; N=1; %s0, (1/8)
%f=0.01; delta=(1/8)*64/64; N=1; %s0, 
%f=0.03; delta=(1/4)*64/64; N=1; %s0, 1/4 (1/4: 0.5158) 
%f=0.1; delta=1*64/64; N=1; %s0, 1/ru2 (1: 0.5193)
%f=0.3; delta=2*64/64; N=1; %s0, 2
%f=0.5; delta=4*64/64; N=1; %s0, 4
%f=1; delta=8*64/64; N=1; %s0, 8



PSNRQ=zeros(1,N); PSNRq=PSNRQ; bpp=PSNRQ;

memorial=zeros(3,N,length(f)); c2y=1; 
   for ib=1:N
      del=delta(ib) %%%%%%%%%%%%%%%%%%%%%%%%
      [hdrR,ldrR,hdri,ldri,PSNRQ(ib),PSNRq(ib),bpp(ib)]=HDRcompression(a,f,del,c2y);
   end
   PSNRQ,PSNRq,bpp,Rbpp=bpp(1)/bpp(end)

%hdrR1=hdrR; ldrR1=ldrR;
hdrR2=hdrR; ldrR2=ldrR;
 