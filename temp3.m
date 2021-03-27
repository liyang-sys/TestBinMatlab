%function [r0,c0]=modify_Hilbert2D(H,W)
%r0 is the row index, c0 is the column index. So, when a plot is made, r0
%is in the Y-direction! i.e., plot(c0,r0) !!!
H=31, W=31


load H2
c8=int32(c8); r8=int32(r8);
L8=256*256; L7=L8/4; L6=L7/4; L5=L6/4; L4=L5/4; L3=L4/4; L2=L3/4; L1=L2/4; 
%'r' for rows, 'c' for colomns
c=cell(1,12); r=cell(1,12); %for idx>12, use other extra large size treatment
c{8}=c8; r{8}=r8; 
c{6}=c8(1:L6); r{6}=r8(1:L6);
c{4}=c8(1:L4); r{4}=r8(1:L4);
c{2}=c8(1:L2); r{2}=r8(1:L2);
c{7}=r8(1:L7); r{7}=c8(1:L7);
c{5}=c{7}(1:L5); r{5}=r{7}(1:L5);
c{3}=c{7}(1:L3); r{3}=r{7}(1:L3);
c{1}=c{7}(1:L1); r{1}=r{7}(1:L1);
clear c8 r8

%===================================================================================================

trsz=0;
if H>W
   tem=H; H=W; W=tem; trsz=1;
end
p2s=[1 2 4 8 16 32 64 128 256 512 1024 2048 4096];
[idxH,h]=find_2s_power(H,p2s);
[idxW,w]=find_2s_power(W,p2s);

%----------------------------------------------------------------------------------------------------
ih=1; iw=1; 
Hn0=W; %<==== initialization (as if it was scanned from a previous direction)
r_offset=0; c_offset=0; r0=[]; c0=[];

%The first direction: -------------------------------------------------------------------------------
Hn=H; Wn=w(iw);
[r1,c1,finish,Hn_next,Wn_next,iw,ih]=modifiy_Hilbert2D_ScanByBlock(r,c,Hn,Wn,Hn0,idxW,w,iw,h,ih,p2s);
Hn0=Hn;

r0=[r0 r1]; c0=[c0 c1];
c_offset=c_offset+max(c1);

figure; plot(c1,r1); axis off; axis equal

