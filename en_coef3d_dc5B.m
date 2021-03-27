function [bin,qsb]=en_coef3d_dc5B(Lev_sub,delta0)

h0=1080; w0=1920; %These parameters needs to be coded in C codes.

lev=3; % 6 levels (3+3)
h=zeros(1,lev+1); w=h;
h(1)=h0/8; w(1)=w0/8;
for ia=1:lev
   h(ia+1)=ceil(h(ia)/2);   w(ia+1)=ceil(w(ia)/2);
end
H=cell(1,2); W=H;

%level 6, i.e. the highest level ========================================================================
H{1}=1:h(4); H{2}=h(4)+1:h(3); W{1}=1:w(4); W{2}=w(4)+1:w(3);

bin=[];
r=1; c=1;
sub = double(Lev_sub(H{r}, W{c}, :));
[hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
if min(min(min(sub)))<0
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0);   
else
   sb=coef_scan2d(sub,n);
   qsb=round(sb/delta0); maxqsb=max(qsb); minqsb=min(qsb); %%%%%%%%%%%%%
   nbits=ceil(16.5-log2(delta0));
   bin_max=uint8(abs(dec2bin(maxqsb,nbits))-48);
   nbitsMax=ceil(log2(double(maxqsb)));
   bin_min=uint8(abs(dec2bin(minqsb,nbitsMax))-48);
   
   qsb=qsb-minqsb;
   Nsym=maxqsb-minqsb+1;
   bn=zeros(1,numel(sb)*nbitsMax);
   ptr=1;
   for ia=1:length(qsb)
      bnn=SFcode(qsb(ia)+1,double(Nsym));
      lenbnn=length(bnn);
      bn(ptr:ptr+lenbnn-1)=bnn;
      ptr=ptr+lenbnn;
   end
   bn=[bin_max bin_min bn(1:ptr-1)];
end
bin=[bin bn];
%bitrate=length(bn)/numel(sub) %%%%%%%%%%

rc=[1 2; 2 2; 2 1];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

%level 5: ===============================================================================================
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

%level 4: ===============================================================================================
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

%level 3: ===============================================================================================
h=h(1); w=w(1);
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colA=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

fprintf('\nLevel 2 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colB=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

fprintf('\nLevel 1 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colC=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end
