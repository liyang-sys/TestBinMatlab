function [Lev_sub]=de_coef3dB_cell(bin,h0,w0,delta0)

d0=2;
Lev_sub=zeros(h0,w0,d0);
if d0==8
   k0=3;
elseif d0==4
   k0=2;
elseif d0==2
   k0=1;
end

lev=4; % 6 levels (4+2)
h=zeros(1,lev+1); w=h;
h(1)=h0/4; w(1)=w0/4;
for ia=1:lev
   h(ia+1)=ceil(h(ia)/2);   w(ia+1)=ceil(w(ia)/2);
end
H=cell(1,2); W=H;


%level 6 ==========================================================================================
H{1}=1:h(5); H{2}=h(5)+1:h(4); W{1}=1:w(5); W{2}=w(5)+1:w(4);
r=1; c=1;
n6=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n6);
[subr,ptr]=de_sub3d(bin{5,1},nn,delta0,n6,1); 
Lev_sub( H{r}, W{c}, :) = subr;

rc=[1 2; 2 2; 2 1];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   n6=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n6);
   [subr,ptr]=de_sub3d(bin{5,ia+1},nn,delta0,n6,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 5 ==========================================================================================
H{1}=1:h(4); H{2}=h(4)+1:h(3); W{1}=1:w(4); W{2}=w(4)+1:w(3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   n5=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n5);
   [subr,ptr]=de_sub3d(bin{6,ia},nn,delta0,n5,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 4  ========================================================================================
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   n4=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n4);
   [subr,ptr]=de_sub3d(bin{7,ia},nn,delta0,n4,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 3  ========================================================================================
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   n3=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n3);
   [subr,ptr]=de_sub3d(bin{8,ia},nn,delta0,n3,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 2  =======================================================================================
h=h(1); w=w(1);
n8=modify_Hilbert3D(h,w,k0);   nn=length(n8);
r=1 %%%%%%%%%%%%%%
for c=2:4
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d(bin{r,c},nn,delta0,n8,1); 
   Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
end
for r=2:4
   r %%%%%%%%%%%%%%%%%%%%
   for c=1:4
      %row_col=[r c] %<==================================================
      [subr,ptr]=de_sub3d(bin{r,c},nn,delta0,n8,1); 
      Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
   end
end
