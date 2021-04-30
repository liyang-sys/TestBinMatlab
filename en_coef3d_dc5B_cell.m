function [bin,Nbit,TestBin]=en_coef3d_dc5B_cell(Lev_sub,delta0,AC)
TestBin=[];
[h0,w0]=size(Lev_sub);

lev=3; % 6 levels (3+3)
h=zeros(1,lev+1); w=h;
h(1)=h0/8; w(1)=w0/8;
for ia=1:lev
   h(ia+1)=ceil(h(ia)/2);   w(ia+1)=ceil(w(ia)/2);
end
H=cell(1,2); W=H;
bin=cell(6,4);

%level 6, i.e. the highest level ========================================================================
H{1}=1:h(4); H{2}=h(4)+1:h(3); W{1}=1:w(4); W{2}=w(4)+1:w(3);

r=1; c=1;
sub = double(Lev_sub(H{r}, W{c}, :));
[hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];


%This part needs to modified in the new version. Basically, the DC band is not garanteed
%to be possitive. Thus, this part can treat it as a non-DC band, causing
%inefficiency. 29/10/2017 ===============================================================
%if min(min(min(sub)))<0 
if AC %<===================================================================== modified according to above comments, Jan 9. 2021 !!!
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
TestBin=[TestBin bn];
bin{1,1} = bn;
%bitrate=length(bn)/numel(sub) %%%%%%%%%%
%AC done ------------------------------------------------------------------------------------------------

rc=[1 2; 2 2; 2 1];
%level 6, i.e. the highest level ===============================================================================
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   ia
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{1,ia+1} = bn;
end

   

%level 5: ======================================================================================================
H{1}=1:h(3); H{2}=h(3)+1:h(2); W{1}=1:w(3); W{2}=w(3)+1:w(2);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{2,ia} = bn;
end

%level 4: ======================================================================================================
H{1}=1:h(2); H{2}=h(2)+1:h(1); W{1}=1:w(2); W{2}=w(2)+1:w(1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub(H{r}, W{c}, :));
   [hh,ww]=size(sub);    [t1,t2]=modify_Hilbert2D(hh,ww);   n=[t1;t2];
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{3,ia} = bn;
end

%level 3: ======================================================================================================
h=h(1); w=w(1);
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colA=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{4,ia} = bn;
end

fprintf('\nLevel 2 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colB=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{5,ia} = bn;
end

fprintf('\nLevel 1 -------------------------------\n')
h=h*2; w=w*2;
[t1,t2]=modify_Hilbert2D(h,w);   n=[t1;t2];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colC=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*h+1:r*h, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   TestBin=[TestBin bn];
   bin{6,ia} = bn;
end

Nbit=0;
for ia=1:6
   for ib=1:3
      Nbit=Nbit+numel(bin{ia,ib});
   end
end
