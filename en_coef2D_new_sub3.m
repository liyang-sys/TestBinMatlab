function binary=en_coef2D_new_sub3(coef,delta,H0,W0,binary)

h=H0; w=W0;
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
for cl=2:8 %rw=1;
   %rwcl=[1 cl]
   [bin,xx,qcf]=en_sub2d_new(coef(1:h, (cl-1)*w+1:cl*w),rc,delta); binary=[binary bin]; %l1=length(bin)
end
%fprintf('\n');
for rw=2:8
   %fprintf('rw = %d\n',rw);
   for cl=1:8
      %rwcl=[rw cl] %%%%%%%%%%%%%%%%%%%
      [bin,xx,qcf]=en_sub2d_new(coef((rw-1)*h+1:rw*h, (cl-1)*w+1:cl*w),rc,delta); binary=[binary bin]; %l1=length(bin)
      %[qc,ptr]=de_sub2d(bin,h,w,delta,rc,1);
   end
end

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

%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
lev=6; %<===========================
D=2^lev;
%maxc = 255 * D /delta; maxc=round(1.1*maxc); 
maxc = 255 * D /delta; maxc=round(1.2*maxc); %modified Nov 4, 2020
minval=min(min(coef(1:h,1:w))); %%%%%%%%%%%%%%%%%%
if minval<0
   offset=ceil(abs(minval/D)); %%%%%%%%%%%%%%%
   coef(1:h,1:w)=coef(1:h,1:w)+offset*D;
   %binary=[binary 1 abs(dec2bin(offset,4))-48];
   %binary=[binary 1 abs(dec2bin(offset,5))-48]; %modified Oct 23, 2020
   %modified Nov 4, 2020 =============================================================================
   binary=[binary 1 abs(dec2bin(offset,7))-48]; 
   maxc0=maxc+ceil(offset*D/delta); maxc=max(max(round(coef(1:h,1:w)/delta)))+1;
   binary=[binary  SFcode(maxc,maxc0)];
   %modified Nov 4, 2020 =============================================================================
else
   binary=[binary 0];
end
%offset, maxc, mxval=max(max(round(coef(1:h,1:w)/delta))), mnval=min(min(round(coef(1:h,1:w)/delta))) %%%%%%%%%%%%%%%%%%%
for ia=1:h
   for ib=1:w
      binary=[binary SFcode(round(coef(ia,ib)/delta)+1,maxc)];
   end
end
