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

r=8, c=1,  %<==================================================
sub = double(L2a( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));

load H3L3
n=H3cutted(3,7,n)'+1;
n=[n(2,:); n(3,:); n(1,:)];


%delta=3; T=1*delta; %46.4437, 440678, 444206 (r=3, c=5)
%delta=3.477, T=0.8*delta %46.4487, 429822, 433538
%delta=3.745, T=0.7*delta %46.4481, 425031, 429431
%delta=4.02, T=0.6*delta %46.4470, 421532, 426074

%delta=3; T=1*delta; %45.61, 181732 (r=3, c=8)
%delta=3.635, T=0.8*delta %45.61, 178701
%delta=4.05, T=0.7*delta %45.61, 177997
%delta=4.54, T=0.6*delta %45.61, 179230

%delta=3; T=1*delta; %48.70, 23592 (r=8, c=8)
%delta=3.67; T=0.8*delta; %48.70, 24027 (r=8, c=8)
%delta=3.3; T=0.9*delta; %48.70, 23896 (r=8, c=8)

%delta=3; T=1*delta; %45.94, 102148 (r=7, c=7)
%delta=3.668; T=0.8*delta; %45.94, 102080 (r=7, c=7)
%delta=3.3035; T=0.9*delta; %45.94, 101792 (r=7, c=7)

%delta=3; T=1*delta; %45.541, 154274 (r=8, c=3)
%delta=3; T=1*delta; %45.654, 164139 (r=8, c=2)

delta=3; T=1*delta; %45.796, 174592 (r=8, c=1)


%delta=3, T=1*delta

qcf=quanTHD(sub,T,delta);

subr=rstTHDctr1(qcf,T,delta,0.42*delta,0.46*delta);
e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR0=20*log10(256/e)


zn=sign(abs(qcf));
[cf0,z,sn,cf1]=coef_sign_3d(qcf,n);

%qcfr=coef_sign_3d_inv(cf0,sn,n); err=max(max(max(abs(qcfr-qcf))))


maxcf0=double(max(cf0)) %%%%%%%%%%%
[bin,z,z2]=en_subband_sub1(cf0,z,sn,maxcf0);   lenb=length(bin) %%%%%%%%%%
%[bin,z,z2]=en_subband_sub2(cf0,z,sn,maxcf0,cf1);   lenb=length(bin) %%%%%%%%%%

nc=shist(cf0+1);
%nc(1)=nc(1)*2;
nc(2:4)./nc(1:3)


