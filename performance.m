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
%a=hdrread('\HDRimage\HDRimages\dani_synagogue_o367.hdr');  a=double(a); a=a(1:768,1:1024,:); %Nsteps=1054
%a=hdrread('\HDRimage\HDRimages\MtTamWest_o281.hdr');  a=double(a);  a=a(15:15+703,32:32+1151,:); %Nstep=1740
%a=hdrread('\HDRimage\HDRimages\SpheronNapaValley_oC5D.hdr');  a=double(a);  a=a(9:9+2111,9:9+3007,:); %Nsteps=1785
%a=hdrread('\HDRimage\HDRimages\SpheronNice_o9E0.hdr');  a=double(a);  a=a(7:7+1151,19:19+2943,:); x=max(max(max(a))); a(a>0.09*x)=0.001*x;  %Nsteps=1368
%a=hdrread('\HDRimage\HDRimages\SpheronPriceWestern_o264.hdr');  a=double(a);  a=a(:,5:5+3263,:); x=max(max(max(a))); a(a>0.6*x)=0.5*x; %Nsteps=1425
%a=hdrread('\HDRimage\HDRimages\Tree_oAC1.hdr');  a=double(a);  a=a(5:5+895,17:17+895,:); %Nsteps=2063  %needs to be checked !!!

a=double(pfmread('C:\HDRimage\selected_test_images\Tree.pfm'));



%q=2^(1/5)*ones(1,5);
%delta = 2 *cumprod([1 q]), N=length(delta);


%q1=2^(1/2)*ones(1,2); q2=2^(1/3)*ones(1,3); q3=2^(1/4)*ones(1,4); q4=2^(1/5)*ones(1,5); q5=2^(1/6)*ones(1,6); q6=2^(1/7)*ones(1,7);
%delta = 0.125 *cumprod([1 q1 q2 q3 q4 q5 q6]), N=length(delta)

%q1=2^(1/2)*ones(1,2); 
%q2=2^(1/2)*ones(1,4); q3=2^(1/3)*ones(1,3); q4=2^(1/4)*ones(1,4); q5=2^(1/6)*ones(1,6); q6=2^(1/8)*ones(1,8);
%delta = 0.125 *cumprod([1 q2 q3 q4 q5 q6]), N=length(delta)





%f=[0 0.001 0.003];   del0=[0.25 0.25 0.25];  %s2 
%f=[0.01  0.1  0.2  0.5  1];   del0=[0.5  2  4  8  16  32]/64;

%f=0.2; del0=8/64;



r2=sqrt(2);
q2=2^(1/2)*ones(1,4); q3=2^(1/3)*ones(1,3); q4=2^(1/4)*ones(1,4); q5=2^(1/6)*ones(1,6); q6=2^(1/8)*ones(1,8);
s0=[1 q2 q3 q4 q5 q6];  s1=[1 2 q2 q3 q4 q5 q6];  s2=[1 2 2 q2 q3 q4 q5 q6];


%s=s2; f=[0 0.001]; del0=[0.5 0.5]/64; %3-color
%s=s2; f=[0.002 0.007]; del0=[1 1]/64; %3-color

%s=s2; f=0; del0=0.25/64;
%s=s2; f=0.0001; del0=0.25/64;
%s=s2; f=0.0003; del0=0.25/64;
%s=s2; f=0.001; del0=0.25/64;

%starting from f=0.002, for f<0.002, HDR performance is even worse, coursed by color space transform !!!
%s=s2; f=0.002; del0=0.25/64;
%s=s1; f=[0.004 0.007]; del0=[0.5 0.5]/64;
%s=s1; f=0.01; del0=0.5/64;

%s=s0; f=[0.02 0.04 0.07 0.1 0.2 0.4 0.7 0.9 1]; del0=[ru2 2 4 4 8 16 16 32 32]/64;

%rend05 ===============================================================================================
%s=s0; f=[0 0.0001 0.0003 0.001]; del0=[4 4 4 4]/64;
%s=s0; f=[0.003 0.01  0.03  0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; del0=[4 4 4 4 4 4*r2 8 8 8 8 8 8 8]/64;
%Valley ===============================================================================================
s=s0; f=[0    0.0001 0.0003 0.001  0.003  0.01   0.03   0.1  0.2  0.3  0.4   0.5 0.6 0.7  0.8   0.9  1]; 
  %del0=[.125 .125   .125   .125   .125   .125  .125*r2  r2   2    2   2*r2   4   4   4   4*r2   8   8]/64;
 %  del0=[.125 .125   .125   .125   .125    .25    0.5    r2   2    2   2*r2   4   4   4   4*r2   8   8]/64;


 del0 = [0.75  0.75  0.75  0.75  0.75  0.75  0.75  0.75  0.75  0.75  0.75  0.78 0.78  0.78  0.78  0.78  0.78];
   
%f=0.000, delta=(1/8)*64/64; N=1; %s0, (1/8)
%f=0.01; delta=(1/8)*64/64; N=1; %s0, 
%f=0.03; delta=(1/4)*64/64; N=1; %s0, ru2*1/4 (1/4: 0.5158) 
%f=0.1; delta=1*64/64; N=1; %s0, ru2 (1: 0.5193)
%f=0.3; delta=2*64/64; N=1; %s0, 2
%f=0.5; delta=4*64/64; N=1; %s0, 4
%f=1; delta=8*64/64; N=1; %s0, 8


%memorial_3color=cell(1,2);
%load memorial
%rend05=cell(1,20);
%load rend05

%Valley=cell(1,20);
tem=cell(1,20);

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
   %memorial_3color{ia}=mem(:,:,ia);
   %memorial{ia+8}=mem(:,:,ia);
   %rend05{ia+4}=mem(:,:,ia);
   %Valley{ia}=mem(:,:,ia);
   tem{ia}=mem(:,:,ia);
end

%save memorial memorial memorialA
