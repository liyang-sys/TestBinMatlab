%clc;
%a=hdrread('\HDRimage\HDRimages\memorial_o876.hdr');  a=double(a);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages_originals\rend05_o87A.hdr');  a=double(a); a=a(1:704,:,:);  %Nsteps=2068
%a=hdrread('\HDRimage\HDRimages\dani_belgium_oC65.hdr');  a=double(a); a=a(1:768,1:1024,:);  %Nsteps=1808
%a=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); a=a(1:768,1:1024,:); %Nsteps=1054
%a=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a);  a=a(15:15+703,32:32+1151,:); %Nstep=1740
a=hdrread('\HDRimage\HDRimages_originals\SpheronNapaValley_oC5D.hdr');  a=double(a);  a=a(9:9+2111,9:9+3007,:); %Nsteps=1785
%a=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a);  a=a(7:7+1151,19:19+2943,:); x=max(max(max(a))); a(a>0.09*x)=0.001*x;  %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a);  a=a(:,5:5+3263,:); x=max(max(max(a))); a(a>0.6*x)=0.5*x; %Nsteps=1425
%a=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a);  a=a(5:5+895,17:17+895,:); %Nsteps=2063  %needs to be checked !!!


r2=sqrt(2);
q2=2^(1/2)*ones(1,4); q3=2^(1/3)*ones(1,3); q4=2^(1/4)*ones(1,4); q5=2^(1/6)*ones(1,6); q6=2^(1/8)*ones(1,8);
s0=[1 q2 q3 q4 q5 q6];  s1=[1 2 q2 q3 q4 q5 q6];  s2=[1 2 2 q2 q3 q4 q5 q6];

%Valley ===============================================================================================
s=s0; f=[0    0.0001 0.0003 0.001  0.003  0.01   0.03   0.1  0.2  0.3  0.4   0.5 0.6 0.7  0.8   0.9  1]; 
   del0=[.125 .125   .125   .125   .125    .25    0.5    r2   2    2   2*r2   4   4   4   4*r2   8   8]/64;


rend05=cell(1,20);

N=length(s)
PSNRQ=zeros(1,N); PSNRq=PSNRQ; bpp=PSNRQ;
mem=zeros(3,N,length(f)); c2y=1; 
for ia=1:length(f)
   ff=f(ia), delta = del0(ia) *cumprod(s),
   for ib=N:-1:1
      del=delta(ib) %%%%%%%%%%%%%%%%%%%%%%%%
      [hdrR,ldrR,hdri,ldri,PSNRQ(ib),PSNRq(ib),bpp(ib)]=HDRcompression(a,f(ia),del,c2y);
      [PSNRQ(ib),PSNRq(ib),bpp(ib)]
   end
   PSNRQ,PSNRq,bpp,Rbpp=bpp(1)/bpp(end)
   mem(1,:,ia)=bpp;   mem(2,:,ia)=PSNRQ;   mem(3,:,ia)=PSNRq;
   rend05{ia}=mem(:,:,ia);
end

%save rend05 rend05 f del0
