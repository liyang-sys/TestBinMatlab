function m0=modify_Hilbert3D(H,W,k0)

%r0 is the row index, c0 is the column index. So, when a plot is made, r0
%is in the Y-direction! i.e., plot(c0,r0) !!!

if k0==1
   load H3L1
elseif k0==2
   load H3L2
else
   load H3L3
end
n=int32(double(n));

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
r_offset=0; c_offset=0; r0=[]; c0=[]; d0=[];

%The first direction: -------------------------------------------------------------------------------
Hn=H; Wn=w(iw);
[m,finish,Hn_next,Wn_next,iw,ih]=modify_Hilbert3D_ScanByBlock0(n,Hn,Wn,Hn0,idxW,w,iw,h,ih,p2s);
Hn0=Hn;

r0=[r0 m(1,:)]; c0=[c0 m(2,:)]; d0=[d0 m(3,:)];
c_offset=c_offset+max(m(2,:));

%More directions: -----------------------------------------------------------------------------------
vertical=1; 
while finish==0 %change route direction:
   tem1=H; tem2=idxH; tem3=h; tem4=ih;
   H=W; idxH=idxW; h=w; ih=iw;
   W=tem1; idxW=tem2; w=tem3; iw=tem4;
   Hn=Hn_next; Wn=Wn_next;
   %fprintf('\n===============================================================\n')
   if Hn>1
      [m,finish,Hn_next,Wn_next,iw,ih]=modify_Hilbert3D_ScanByBlock0(n,Hn,Wn,Hn0,idxW,w,iw,h,ih,p2s);
      Hn0=Hn;
   elseif Hn==1
      nw=sum(w(iw:length(w)));
      r1=int32(ones(1,nw)); c1=int32(1:nw);
      finish=1;
   else
      finish=1;
   end
   if vertical>0
      tem=m(2,:); c1=m(1,:); r1=tem; %<==== row and col needs to be exchanged back.
      r1=r1+r_offset; c1=c1+c_offset; 
      r0=[r0 r1]; c0=[c0 c1]; d0=[d0 m(3,:)];
      
      r_offset=max(r1);  %<==== r_offset needs to be modified
   else
      r1=m(1,:)+r_offset; c1=m(2,:)+c_offset; 
      r0=[r0 r1]; c0=[c0 c1]; d0=[d0 m(3,:)];

      c_offset=max(m(2,:)); %<=== c_offset needs to be modified
   end
   vertical=-vertical;
end
%----------------------------------------------------------------------------------------------------

if trsz==1
   tem=c0; c0=r0; r0=tem;
end

%len=length(m); x=m(:,2:len)-m(:,1:len-1); x=sum(abs(x)); maxmin=[max(x) min(x)]
%m0=[r0; c0; d0]; len=length(m0); x=m0(:,2:len)-m0(:,1:len-1); x=sum(abs(x)); maxmin0=[max(x) min(x)]

m0=[r0; c0; d0];
