%function m0=modify_Hilbert3D(H,W,k0)

%r0 is the row index, c0 is the column index. So, when a plot is made, r0
%is in the Y-direction! i.e., plot(c0,r0) !!!

k0=3;
%H=9, W=24,
%H=9, W=16,

%H=248,W=128,

%H=1, W=16,
H=7, W=64,


if k0==1
   load H3L1
elseif k0==2
   load H3L2
else
   load H3L3
end
n=int32(double(n));

%===================================================================================================

p2s=[1 2 4 8 16 32 64 128 256 512 1024 2048 4096];
[idxH,h]=find_2s_power(H,p2s);
[idxW,w]=find_2s_power(W,p2s);

%----------------------------------------------------------------------------------------------------
ih=1; iw=1; 
Hn0=W; %<==== initialization (as if it was scanned from a previous direction)
r_offset=0; c_offset=0; r0=[]; c0=[]; d0=[];

%The first direction: -------------------------------------------------------------------------------
Hn=H, Wn=w(iw) 
[m,finish,Hn_next,Wn_next,iw,ih]=modify_Hilbert3D_ScanByBlock(n,Hn,Wn,Hn0,idxW,w,iw,h,ih,p2s);
Hn0=Hn;

r0=[r0 m(1,:)]; c0=[c0 m(2,:)]; d0=[d0 m(3,:)];
c_offset=c_offset+max(m(2,:));

figure; plot3(m(1,:),m(2,:),m(3,:)); axis off; axis equal
len=length(m); x=m(:,1:len-1)-m(:,2:len); x=sum(abs(x));  maxmin=[max(x) min(x)], len-H*W*2^k0 



