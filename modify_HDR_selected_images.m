
%a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\rend05_o87A.hdr');  a=double(a); a=a(1:704,:,:);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a); a=a(1:768,1:1024,:);  %Nsteps=1808
%a=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); a=a(1:768,1:1024,:); %Nsteps=1054
%a=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a);  a=a(15:15+703,32:32+1151,:); %Nstep=1740
%a=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a);  a=a(9:9+2111,9:9+3007,:); %Nsteps=1785
%a=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a);  a=a(7:7+1151,19:19+2943,:); x=max(max(max(a))); a(a>0.09*x)=0.001*x;  %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a);  a=a(:,5:5+3263,:); x=max(max(max(a))); a(a>0.6*x)=0.5*x; %Nsteps=1425
a=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a);  a=a(5:5+895,17:17+895,:); %Nsteps=2063  %needs to be checked !!!

isgry=0;
%pfmwrite(a,'\HDRimage\test_images\Tree.pfm', isgry);
b = pfmread_op('\HDRimage\test_images\Tree.pfm');

err=max(max(max(abs(double(single(a))-double(b)))))


max(max(max(a)))
figure; imshow(a.^0.3/max(max(max(a.^0.3))))


%a=hdrread('\HDRimage\HDRimages\dani_cathedral_oBBC.hdr');  a=double(a); %Nsteps=1147
%a=hdrread('\HDRimage\HDRimages\Spheron3_oBAC.hdr');  a=double(a); %Nstep=4160 %Very interesting picture! probably only needs the scaling curves to magnify certain areas!
