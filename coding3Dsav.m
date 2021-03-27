%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);

%------------------------------------------------------------------
w=128; nn=128*128*8;
load Threshold
Tarr=T;


%r=6; c=7;  %Old T=5 <=== very random zz!!!
%r=5; c=3;  %Kimono, Park, T=5 <=== not random zz!!!
%r=5; c=3;  %Cactus T=5 <=== slightly random
%r=5; c=7;  %BQ T=5 <=== not random zz
%r=5; c=7;  %Cactus T=5 <=== slightly random


r=5; c=8; %

r=2; c=5; %T=2 Cactus Jan 14, 15 

r=5; c=3;  %crowdrun delta=2, Dec 14, and Kimono

r=3; c=2;  %

r=1; c=2; %<===== Jan 10, 15 
%r=1; c=5; 

%r=7; c=7; %T=2, BQ
%r=8; c=8; %T=2, BQ





%r=6; c=6;  %BQ del=2, L2c <===== on study 30/11/2014

row_col=[r c] %<==================================================
sub = double(L2c( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));

load H3L3
n=H3cutted(3,7,n)'+1;
n=[n(2,:); n(3,:); n(1,:)];

delta=19; %<=======================================================
%delta=12; %<=======================================================
%delta=9; %<=======================================================
%delta=7.5; %<=======================================================
delta=6; %<=======================================================
%delta=5; %<=======================================================
%delta=4; %<=======================================================
%delta=3.5; %<=======================================================
%delta=2.5; %<=======================================================
%delta=2; %<=======================================================
%delta=1.5; %<=======================================================
%delta=0.5; %<=======================================================
%delta=0.35; %<=======================================================

[t,h,t2,h2]=find_T_and_Del(sub,delta); 
if h2<h
   T=t2*h2*delta; delt=h2*delta;
else
   T=t*h*delta; delt=h2*delta;
end
T %<=================%%%%%%%%%%%%%%%%%%%%%%%
qcf=quanTHD(sub,T,delt);
%zn=sign(abs(qcf)); figure; imshow(1-zn(:,:,1)) %%%%%%%%%%%%%%%%%

subr=rstTHDctr1(qcf,T,delt,0.42*delt,0.46*delt);
e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR0=20*log10(256/e)

[cf0,abssb,sb,sn_z,z,sn0,cf10]=coef_scan3d(sub,qcf,n);
z0=z;

%[sum(sign(cf0)),sum(abs(sn_z)), length(sn_z)]
%biny0=en_sub3d(cf0,cf10,sn0,nn);





%prelimilary trim test : ------------------------------------------------------
%cf0=trim_coef(cf0,abssb,delt);
%nc=hist(double(cf0)+1,[1:max(double(cf0)+1)]);
%alph=-log(nc(3)/nc(2));
%[t3,h3]=find_thred_laplace(alph);
%if h3<h
 %  T=t3*h3*delta; delt=h3*delta;
%else
 %  T=t*h*delta; delt=h3*delta;
%end

%T %<=================%%%%%%%%%%%%%%%%%%%%%%%
%qcf=quanTHD(sub,T,delt);
%zn=sign(abs(qcf)); figure; imshow(1-zn(:,:,1)) %%%%%%%%%%%%%%%%%

%subr=rstTHDctr1(qcf,T,delt,0.42*delt,0.46*delt);
%e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
%SNR0=20*log10(256/e)

%[cf0,abssb,sb,sn_z,z]=coef_scan3d(sub,qcf,n);
%shist(cf0+1) %%%%%%%%%%%%%%%%%%%%%

%This part has a problem: t3, h3 are from 'delt', not 'delta'!  Nov 14, 2014
%-------------------------------------------------------------------------------




[cf0,dn]=trim_coefsav(cf0,abssb,delt,Tarr); dn %%%%%%%%%%%%%
cf0=fliplr(cf0); sbr=fliplr(abssb);
[cf0,dn]=trim_coefsav(cf0,sbr,delt,Tarr); cf0=fliplr(cf0);   %dn %%%%%%%%%%%%%
[cf0,dn]=trim_coefsav(cf0,abssb,delt,Tarr);  %dn %%%%%%%%%%%%%

%qcf_trim=coef_scan3d_inv(double(cf0).*double(sn_z),n);
%zn_trim=sign(abs(qcf_trim));  figure; imshow(1-zn_trim(:,:,1)) %%%%%%%%%%%%%%%%%%%%%%%% 

[cf0,dn]=trim_coef_2pixsav(cf0,abssb,delt,T,Tarr);  dn2=dn %%%%%%%%%%%%%
cf0=fliplr(cf0); [cf0,dn]=trim_coef_2pixsav(cf0,sbr,delt,T,Tarr); cf0=fliplr(cf0);  %dn %%%%%%%%%%%%%
%cf0=trim_coef_2pixsav(cf0,abssb,delt,T,Tarr);


[cf0,dn]=trim_coef_3pixsav(cf0,abssb,delt,T,Tarr);  dn3=dn %%%%%%%%%%%%%
cf0=fliplr(cf0); [cf0,dn]=trim_coef_3pixsav(cf0,sbr,delt,T,Tarr); cf0=fliplr(cf0);  %dn %%%%%%%%%%%%%

[cf0,dn]=trim_coef_4pixsav(cf0,abssb,delt,T,Tarr);  dn4=dn %%%%%%%%%%%%%
%cf0=fliplr(cf0); cf0=trim_coef_4pixsav(cf0,sbr,delt,T,Tarr); cf0=fliplr(cf0);

[cf0,dn]=trim_coef_5pixsav(cf0,abssb,delt,T,Tarr);  dn5=dn %%%%%%%%%%%%%

%cf0=trim_coefsav(cf0,abssb,delt);

qcf_trim=coef_scan3d_inv(double(cf0).*double(sn_z),n);
%zn_trim=sign(abs(qcf_trim));  figure; imshow(1-zn_trim(:,:,1)) %%%%%%%%%%%%%%%%%%%%%%%

zz=sign(cf0);
dNnon=(sum(z)-sum(zz))/sum(z) %%%%%%%%%%%%%%%%%%%%%
%(sum(z)-sum(zz)) %%%%%%%%%%%%%%%%%

subr=rstTHDctr1(qcf_trim,T,delt,0.42*delt,0.46*delt);
e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR0=20*log10(256/e) %%%%%%%%%%%%%%%%%%


sn_z_trim=sign(cf0).*int16(sn_z); sn=zeros(1,nn); cf1=sn;
ptr=1;
for ia=1:nn
   if cf0(ia)~=0
      cf1(ptr)=cf0(ia);
      sn(ptr)=sign(sn_z_trim(ia));
      ptr=ptr+1;
   end
end
sn=uint8(sign(sn(1:ptr-1)+1)); cf1=int16(cf1(1:ptr-1));




%biny=en_sub3d(cf0,cf1,sn,nn);
