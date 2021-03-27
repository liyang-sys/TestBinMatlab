function [Lev_sub,ptr]=de_coef3d_cell(bin,h0,w0,d0,delta0)

%h0=1080; w0=1920; %This information needs to be coded in C code <====================== !!!

if d0==8
   k0=3;
elseif d0==4
   k0=2;
elseif d0==2
   k0=1;
end
Lev_sub=zeros(h0,w0,d0);

lev=2; 
%level 5 (2+3), i.e. the highest level ======================================================
h=zeros(1,lev+1); w=h;
h(1)=h0/8; w(1)=w0/8;
for ia=1:lev
   h(ia+1)=ceil(h(ia)/2);   w(ia+1)=ceil(w(ia)/2);
end
H=cell(1,2); W=H;
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
iter=0;
for r=1:2
   for c=1:2
      iter=iter+1;
      %fprintf('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n')
      %row_col=[r c] %<============================
      bn=bin{9,iter};
            
%       fid=fopen('mbin.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%      fwrite(fid,uint8(bn),'uint8');
%      fclose(fid);
%       
      n5=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n5);
      [subr,ptr]=de_sub3d(bn,nn,delta0,n5,1); 
      Lev_sub( H{r}, W{c}, :) = subr;
   end
end

%level 4: =======================================================================================
rc=[1 2; 2 2; 2 1];
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<================================
   bn=bin{10,ia};
   n6=modify_Hilbert3D(length(H{r}),length(W{c}),k0);   nn=length(n6);
   [subr,ptr]=de_sub3d(bn,nn,delta0,n6,1); 
   Lev_sub( H{r}, W{c}, :) = subr;
end

%level 4: =======================================================================================
h=h(1); w=w(1);
n7=modify_Hilbert3D(h,w,k0);   nn=length(n7);
r=1 %%%%%%%%%%%%%%%%%%%%%
for c=2:8
   %row_col=[r c] %<=================================
   bn=bin{r,c};
   [subr,ptr]=de_sub3d(bn,nn,delta0,n7,1); 
   Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
end
for r=2:8
   r
   for c=1:8
      %row_col=[r c] %<==============================
      bn=bin{r,c};
      [subr,ptr]=de_sub3d(bn,nn,delta0,n7,1); 
      Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :) = subr;
   end
end
