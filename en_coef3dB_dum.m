function Lev_subr=en_coef3dB_dum(Lev_sub,delta0)

px0=1;
load H3L1

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

%whos %%%%%%%%%%%%%%%%%%%%%%

Lev_subr=zeros(size(Lev_sub));

bin=cell(8,4);

w=2^4;
r=1; c=1;
sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n4,delta0); 

rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sb{ia} = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
end
[sb{1},sb{2},sb{3}]=en_sub3d3_dum(sb{1},sb{2},sb{3},n4,delta0);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = sb{ia};
end

w=2^5;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n5,delta0);
end

w=2^6;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n6,delta0);
end

w=2^7;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n7,delta0);
end

w=2^8;
r=1
for c=2:4
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n8,delta0);
end
for r=2:4
   r
   for c=1:4
      %row_col=[r c] %<==================================================
      sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
      Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dum(sub,n8,delta0);
   end
end
