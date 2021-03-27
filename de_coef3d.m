function [Lev_sub,ptr]=de_coef3d(bin,wh,delta0,ptr)

if wh==8
   load H3L3
   px0=3;
elseif wh==4
   load H3L2
   px0=2;
elseif wh==2
   load H3L1
   px0=1;
end

Lev_sub=zeros(1024,1024,2^px0);

n7=H3cutted(px0,7,n)'+1;
n7=[n7(2,:); n7(3,:); n7(1,:)];

n6=H3cutted(px0,6,n)'+1;
n6=[n6(2,:); n6(3,:); n6(1,:)];

n5=H3cutted(px0,5,n)'+1;
n5=[n5(2,:); n5(3,:); n5(1,:)];

n4=H3cutted(px0,4,n)'+1;
n4=[n4(2,:); n4(3,:); n4(1,:)];

%whos %%%%%%%%%%%%%%%%%%%%%%

w=2^5; nn=w*w*wh;
for r=1:2
   for c=1:2
      %fprintf('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n')
      %row_col=[r c] %<==================================================
      [subr,ptr]=de_sub3d(bin,nn,delta0,n5,ptr); 
      Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
   end
end

w=2^6; nn=w*w*wh;
rc=[1 2; 2 2; 2 1];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n6,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^7; nn=w*w*wh;
r=1 %%%%%%%%%%%%%%%%%%%%%
for c=2:8
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin,nn,delta0,n7,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end
for r=2:8
   r
   for c=1:8
      %row_col=[r c] %<==================================================
      [subr,ptr]=de_sub3d(bin,nn,delta0,n7,ptr); 
      Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
   end
end
