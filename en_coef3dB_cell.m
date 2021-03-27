function [bin,Nbit,TestBin]=en_coef3dB_cell(Lev_sub,delta0)
TestBin=[];
[h0,w0,d0]=size(Lev_sub);
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
bin=cell(8,4);

%level 6 ==========================================================================================
H{1}=1:h(5); H{2}=h(5)+1:h(4); W{1}=1:w(5); W{2}=w(5)+1:w(4);
r=1; c=1;
sub = double(Lev_sub(H{r}, W{c}, :));
[hh,ww,d0]=size(sub);
n6=modify_Hilbert3D(hh,ww,k0);
[bn,qcf]=en_sub3d(sub,n6,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%  
TestBin=[TestBin bn];
bin{5,1} = bn;

rc=[1 2; 2 2; 2 1];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww,d0]=size(sub);
   n6=modify_Hilbert3D(hh,ww,k0);
   [bn,qcf]=en_sub3d(sub,n6,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{5,ia+1} = bn;
end

%level 5  ========================================================================================
H{1}=1:h(4); H{2}=h(4)+1:h(3); W{1}=1:w(4); W{2}=w(4)+1:w(3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<======================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww,d0]=size(sub);
   n5=modify_Hilbert3D(hh,ww,k0);
   [bn,qcf]=en_sub3d(sub,n5,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{6,ia} = bn;
end

%level 4  ========================================================================================
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<======================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww,d0]=size(sub);
   n6=modify_Hilbert3D(hh,ww,k0);
   [bn,qcf]=en_sub3d(sub,n6,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{7,ia} = bn;
end

%level 3  ========================================================================================
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<=========================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww,d0]=size(sub);
   n7=modify_Hilbert3D(hh,ww,k0);
   [bn,qcf]=en_sub3d(sub,n7,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{8,ia} = bn;
end

%level 2  =======================================================================================
h=h(1); w=w(1);
n8=modify_Hilbert3D(h,w,k0);
r=1
for c=2:4
   %row_col=[r c] %<=========================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n8,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{r,c} = bn;
end
for r=2:4
   r
   for c=1:4
      %row_col=[r c] %<=======================
      sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
      [bn,qcf]=en_sub3d(sub,n8,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
      TestBin=[TestBin bn];
      bin{r,c} = bn;
   end
end

Nbit=0;
for ia=1:8
   for ib=1:4
      Nbit=Nbit+numel(bin{ia,ib});
   end
end
