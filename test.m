clc;

h=1080; w=1920; f1=1; Nframe=96; fmt=422; bitdepth=8;
a=double(read_yuv('BirdsInCage_1920x1080_60_8bit_422.yuv',h,w,f1,Nframe,fmt,bitdepth));
k=0; 
a=single(a);  
coef=transform_3d_cfp8B(a,k);  %±ä»»

clear qcoef qcoef_dum;

delta0=5;
%²âÊÔ
L2c=coef(:,:,[33:40]-8); Lev_sub=L2c;
sub = double(Lev_sub(811:945, 1:240, :));
[h,w,d0]=size(sub);
n7=modify_Hilbert3D(h,w,3);
%±àÂë--------------------------
[bn,qcf]=en_sub3d(sub,n7,delta0); 
%½âÂë--------------------------
nn=length(n7);
[subr,ptr]=de_sub3d(bn,nn,delta0,n7,1); 