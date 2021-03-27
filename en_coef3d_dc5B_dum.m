function [Lev_subr] = en_coef3d_dc5B_dum(Lev_sub,delta0,n)

Lev_subr=zeros(size(Lev_sub));

w=2^4;
r=1; c=1;
sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
if min(min(min(sub)))<0
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dc5_dum(sub,n,delta0);
else
   sb=coef_scan2d(sub,n);
   qsb=round(sb/delta0); maxqsb=max(qsb); minqsb=min(qsb); %%%%%%%%%%%%%

   sbr=qsb*delta0;
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = coef_scan2d_inv(sbr,n);
end


rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sb{ia} = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
end
[sb{1},sb{2},sb{3}]=en_sub3d3_dc5_dum(sb{1},sb{2},sb{3},n,delta0); 
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = sb{ia};
end


w=2^5;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = en_sub3d_dc5_dum(sub,n,delta0);   
end

w=2^6;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   subr=en_sub3d_dc5_dum(sub,n,delta0);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^7;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colA=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   subr=en_sub3d_dc5_dum(sub,n,delta0);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 2 -------------------------------\n')
w=2^8;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colB=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   subr=en_sub3d_dc5_dum(sub,n,delta0);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 1 -------------------------------\n')
w=2^9;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colC=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   subr=en_sub3d_dc5_dum(sub,n,delta0);
   Lev_subr( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end
