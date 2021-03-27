function binary=en_coef2D_new_sub2(coef,delta,H0,W0,binary)

h=bitshift(H0,1); w=bitshift(W0,1);
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
for cl=2:4 %rw=1;
   [bin,xx,qcf]=en_sub2d_new(coef(1:h, (cl-1)*w+1:cl*w),rc,delta); binary=[binary bin]; %l1=length(bin)
end
%fprintf('\n');
for rw=2:4
   %fprintf('rw = %d\n',rw);
   for cl=1:4
      [bin,xx,qcf]=en_sub2d_new(coef((rw-1)*h+1:rw*h, (cl-1)*w+1:cl*w),rc,delta); binary=[binary bin]; %l1=length(bin)
      %[tem,ptr]=de_sub2d(bin,h,w,delta,rc,1);
      %max(max(abs(tem-coef((rw-1)*h+1:rw*h, (cl-1)*w+1:cl*w))))
   end
end

%fprintf('Encoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=H0; ww=w; w=W0;
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
[bin,xx,qcf]=en_sub2d_new(coef(1:h,w+1:ww),rc,delta); binary=[binary bin]; %l1=length(bin);
[bin,xx,qcf]=en_sub2d_new(coef(h+1:hh,1:w),rc,delta); binary=[binary bin]; %l2=length(bin);
[bin,xx,qcf]=en_sub2d_new(coef(h+1:hh,w+1:ww),rc,delta); binary=[binary bin]; %l3=length(bin);
%len=l1+l2+l3

%fprintf('Encoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
[bin,xx,qcf]=en_sub2d_new(scanHilbert2D(coef(1:h,w+1:ww)),-1,delta); binary=[binary bin]; %l1=length(bin);
[bin,xx,qcf]=en_sub2d_new(scanHilbert2D(coef(h+1:hh,1:w)),-1,delta); binary=[binary bin]; %l2=length(bin);
[bin,xx,qcf]=en_sub2d_new(scanHilbert2D(coef(h+1:hh,w+1:ww)),-1,delta); binary=[binary bin]; %l3=length(bin);
%len=l1+l2+l3


%fprintf('Encoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
sub=[scanHilbert2D(coef(1:h,w+1:ww)) scanHilbert2D(coef(h+1:hh,w+1:ww)) scanHilbert2D(coef(h+1:hh,1:w))];
[bin,xx,qcf]=en_sub2d_new(sub,-1,delta);
binary=[binary bin];

%fprintf('Encoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
sub=[scanHilbert2D(coef(1:h,w+1:ww)) scanHilbert2D(coef(h+1:hh,w+1:ww)) scanHilbert2D(coef(h+1:hh,1:w))];
[bin,xx,qcf]=en_sub2d_new(sub,-1,delta);
binary=[binary bin];

%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
lev=6; %<===========================
D=2^lev;
maxc = 255 * D /delta; maxc=round(1.1*maxc);
minval=min(min(coef(1:h,1:w))); %%%%%%%%%%%%%%%%%%
if minval<0
   offset=ceil(abs(minval/D)); %%%%%%%%%%%%%%%
   coef(1:h,1:w)=coef(1:h,1:w)+offset*D;
   %binary=[binary 1 abs(dec2bin(offset,4))-48];
   %binary=[binary 1 abs(dec2bin(offset,5))-48]; %modified Oct 23, 2020
   %modified Oct 30, 2020 =======================================================
   binary=[binary 1 abs(dec2bin(offset,7))-48]; %modified Oct 30, 2020
   maxc0=maxc; maxc=max(max(round(coef(1:h,1:w)/delta)))+1; %added Oct 30, 2020
   binary=[binary  SFcode(maxc,maxc0)]; %added Oct 30, 2020
   %modified Oct 30, 2020 =======================================================
else
   binary=[binary 0];
end

for ia=1:h
   for ib=1:w
      binary=[binary SFcode(round(coef(ia,ib)/delta)+1,maxc)];
   end
end
