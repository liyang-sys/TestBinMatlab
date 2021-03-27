function [Lev_sub]=de_coef3d_dc5B_cell(bin,delta0,h0,w0,dc)

%h0=1080; w0=1920; %These parameters need to be coded in C codes.
Lev_sub=zeros(h0,w0);

lev=3; % 6 levels (3+3)
h=zeros(1,lev+1); w=h;
h(1)=h0/8; w(1)=w0/8;
for ia=1:lev
   h(ia+1)=ceil(h(ia)/2);   w(ia+1)=ceil(w(ia)/2);
end
H=cell(1,2); W=H;

%level 6, i.e. the highest level ========================================================================
H{1}=1:h(4); H{2}=h(4)+1:h(3); W{1}=1:w(4); W{2}=w(4)+1:w(3);
r=1; c=1;
[t1,t2]=modify_Hilbert2D(length(H{r}),length(W{c}));   n=[t1;t2];  nn=length(n);
hh=length(H{r}); ww=length(W{c});
bn=bin{1,1}; ptr=1;
if dc
   nbits=ceil(16.5-log2(delta0));
   bnn=bn(ptr:ptr+nbits-1); ptr=ptr+nbits;
   maxqsb=bin2dec(char(bnn+48));
   
   nbitsMax=ceil(log2(double(maxqsb)));
   bnn=bn(ptr:ptr+nbitsMax-1); ptr=ptr+nbitsMax;
   minqsb=bin2dec(char(bnn+48));
   Nsym=maxqsb-minqsb+1;

   subr=zeros(hh,ww);
   for ia=1:nn
      [subr(n(1,ia),n(2,ia)),ptr] = deSFcode(bn,Nsym,ptr);
   end
   %qdc=subr; %%%%%%%%%%%%%%%%%
   subr = (double(subr)-1 +double(minqsb)) *delta0;
   Lev_sub( H{r}, W{c}, :) = subr;
else
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,hh,ww,ptr); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

rc=[1 2; 2 2; 2 1];
for ia=1:3
   bn=bin{1,ia+1};
   r=rc(ia,1); c=rc(ia,2); hh=length(H{r}); ww=length(W{c});
   [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];  nn=length(n); 
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,hh,ww,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 5: ======================================================================================================
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
for ia=1:3
   bn=bin{2,ia};
   r=rc(ia,1); c=rc(ia,2); hh=length(H{r}); ww=length(W{c});
   %row_col=[r c] %<==================================================
   [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];  nn=length(n); 
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,hh,ww,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 4: ======================================================================================================
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   bn=bin{3,ia};
   r=rc(ia,1); c=rc(ia,2); hh=length(H{r}); ww=length(W{c});
   %row_col=[r c] %<==================================================
   [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];  nn=length(n); 
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,hh,ww,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 3: ======================================================================================================
h=h(1); w=w(1);
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];  nn=length(n);
for ia=1:3
   bn=bin{4,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,h,w,1); 
   Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 2 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];  nn=length(n);
for ia=1:3
   bn=bin{5,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,h,w,1); 
   Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 1 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];  nn=length(n);
for ia=1:3
   bn=bin{6,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,h,w,1); 
   Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
end
