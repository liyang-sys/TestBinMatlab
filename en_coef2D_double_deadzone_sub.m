function binary=en_coef2D_double_deadzone_sub(coef,delta,H0,W0,binary)

fprintf('\nEncoding level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=bitshift(H0,3); h=bitshift(H0,2); ww=bitshift(W0,3); w=bitshift(W0,2);
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(1:h,w+1:ww),rc,delta); binary=[binary bin]; %l1=length(bin)
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,1:w),rc,delta); binary=[binary bin]; %l2=length(bin)
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,w+1:ww),rc,delta); binary=[binary bin]; %l3=length(bin)
%len=l1+l2+l3

fprintf('Encoding level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=bitshift(H0,1); ww=w; w=bitshift(W0,1);
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(1:h,w+1:ww),rc,delta); binary=[binary bin]; %l1=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,1:w),rc,delta); binary=[binary bin]; %l2=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,w+1:ww),rc,delta); binary=[binary bin]; %l3=length(bin);
%len=l1+l2+l3

fprintf('Encoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=H0; ww=w; w=W0;
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(1:h,w+1:ww),rc,delta); binary=[binary bin]; %l1=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,1:w),rc,delta); binary=[binary bin]; %l2=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(coef(h+1:hh,w+1:ww),rc,delta); binary=[binary bin]; %l3=length(bin);
%len=l1+l2+l3

%fprintf('Encoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
[bin,xx,qcf]=en_sub2d_double_deadzone(scanHilbert2D(coef(1:h,w+1:ww)),-1,delta); binary=[binary bin]; %l1=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(scanHilbert2D(coef(h+1:hh,1:w)),-1,delta); binary=[binary bin]; %l2=length(bin);
[bin,xx,qcf]=en_sub2d_double_deadzone(scanHilbert2D(coef(h+1:hh,w+1:ww)),-1,delta); binary=[binary bin]; %l3=length(bin);
%len=l1+l2+l3


%fprintf('Encoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
sub=[scanHilbert2D(coef(1:h,w+1:ww)) scanHilbert2D(coef(h+1:hh,w+1:ww)) scanHilbert2D(coef(h+1:hh,1:w))];
[bin,xx,qcf]=en_sub2d_double_deadzone(sub,-1,delta);
binary=[binary bin];

%fprintf('Encoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
sub=[scanHilbert2D(coef(1:h,w+1:ww)) scanHilbert2D(coef(h+1:hh,w+1:ww)) scanHilbert2D(coef(h+1:hh,1:w))];
[bin,xx,qcf]=en_sub2d_double_deadzone(sub,-1,delta);
binary=[binary bin];

%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
lev=6; %<===========================
D=2^lev;
maxc = 255 * D /delta; maxc=round(1.1*maxc);
minval=min(min(coef(1:h,1:w))); %%%%%%%%%%%%%%%%%%
if minval<0
   offset=ceil(abs(minval/D)); %%%%%%%%%%%%%%%
   coef(1:h,1:w)=coef(1:h,1:w)+offset*D;
   binary=[binary 1 abs(dec2bin(offset,4))-48];
else
   binary=[binary 0];
end

for ia=1:h
   for ib=1:w
      binary=[binary SFcode(round(coef(ia,ib)/delta)+1,maxc)];
   end
end
