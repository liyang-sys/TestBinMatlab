function [Lev_sub,ptr]=de_coef3dB(bin,delta0,ptr)

wh=2; px0=1;
load H3L1
n=uint16(n);

n8=H3cutted(px0,8,n)'+1; 
n8=[n8(2,:); n8(3,:); n8(1,:)];

n7=H3cutted(px0,7,n)'+1;
n7=[n7(2,:); n7(3,:); n7(1,:)];

n6=H3cutted(px0,6,n)'+1;
n6=[n6(2,:); n6(3,:); n6(1,:)];

n5=H3cutted(px0,5,n)'+1;
n5=[n5(2,:); n5(3,:); n5(1,:)];

n4=H3cutted(px0,4,n)'+1;
n4=[n4(2,:); n4(3,:); n4(1,:)];

Lev_sub=zeros(1024,1024,2^px0);



w=2^4; nn=w*w*wh;
r=1; c=1;
[subr,ptr]=de_sub3d(bin,nn,delta0,n4,ptr); 
Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;

rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
[sb{1},sb{2},sb{3},ptr]=de_sub3d3(bin,nn*3,delta0,n4,ptr);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = sb{ia};
end

w=2^5; nn=w*w*wh;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n5,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^6; nn=w*w*wh;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n6,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^7; nn=w*w*wh;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n7,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^8; nn=w*w*wh;
r=1 %%%%%%%%%%%%%%
for c=2:4
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n8,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end
for r=2:4
   r %%%%%%%%%%%%%%%%%%%%
   for c=1:4
      %row_col=[r c] %<==================================================
      [subr,ptr]=de_sub3d(bin,nn,delta0,n8,ptr); 
      Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
   end
end
