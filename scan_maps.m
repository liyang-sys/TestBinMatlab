%sz=[512 512];

load H2ext
rout=int16(zeros(2,1024^2));
L=512*512;
rout(:,1:L)=routxy; 
tem=[routxy(2,:)+512; routxy(1,:)]; %[tem(:,1) tem(:,262144)]
rout(:,L+1:2*L)=tem;
tem=[routxy(2,:)+512; routxy(1,:)+512];  %[tem(:,1) tem(:,262144)]
rout(:,2*L+1:3*L)=tem;
tem=[513-routxy(1,:); (513-routxy(2,:))+512];  %[tem(:,1) tem(:,262144)]
rout(:,3*L+1:4*L)=tem;
routxy=rout;
clear rout tem x x2 x23 x3 x4 xx  y y2 y23 y3 y4 yy routxy2 routxy3 routxy4 routxy5 routxy6 routxy7
%========================================================================

len=sz(1)*sz(2);
map_hilbert=uint32(zeros(sz));   map_row=map_hilbert;   map_col=map_row;
rout_col=int16(zeros(2,len)); rout_row=rout_col;
yr=1; yc=1; %sz(1) direction
xr=1; xc=1; %sz(2) direction
direction_row=1;   direction_col=1;
for n=1:len
   map_hilbert(routxy(1,n),routxy(2,n))=n;
   
   if direction_row==1
      rout_col(1,n)=yr;    rout_col(2,n)=xr;
      if xr==sz(2) 
         direction_row=-1; yr=yr+1;
      else
         xr=xr+1;
      end
   else
      rout_col(1,n)=yr;    rout_col(2,n)=xr;
      if xr==1
         direction_row=+1; yr=yr+1;
      else
         xr=xr-1;
      end
   end
   map_row(rout_col(1,n),rout_col(2,n))=n;
   
   if direction_col==1
      rout_row(1,n)=yc;    rout_row(2,n)=xc;
      if yc==sz(1) 
         direction_col=-1; xc=xc+1;
      else
         yc=yc+1;
      end
   else
      rout_row(1,n)=yc;    rout_row(2,n)=xc;
      if yc==1
         direction_col=+1; xc=xc+1;
      else
         yc=yc-1;
      end
   end
   map_col(rout_row(1,n),rout_row(2,n))=n;
end

%plot(rout_col(1,:), rout_col(2,:)); axis off;
%figure; plot(rout_row(1,:), rout_row(2,:)); axis off;
