function [qc,ptr]=de_coef2D_new_sub3(binary,H0,W0,ptr,delta)

h=H0; w=W0;
[r,c]=modify_Hilbert2D(h,w); rc=[r;c];
for cl=2:8 %rw=1;
    %rwcl=[1 cl] %%%%%%%%%%%%%%%%%%%
   [qc(1:h, (cl-1)*w+1:cl*w),ptr]=de_sub2d(binary,h,w,delta,rc,ptr);
end
for rw=2:8
   %fprintf('rw = %d\n',rw);
   for cl=1:8
      [qc((rw-1)*h+1:rw*h, (cl-1)*w+1:cl*w),ptr]=de_sub2d(binary,h,w,delta,rc,ptr);
   end
end

%fprintf('Decoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
[r,c]=modify_Hilbert2D(h,ww-w); rc=[r;c];
[qc(1:h,w+1:ww),ptr]=de_sub2d(binary,h,ww-w,delta,rc,ptr);
[r,c]=modify_Hilbert2D(hh-h,w); rc=[r;c];
[qc(h+1:hh,1:w),ptr]=de_sub2d(binary,hh-h,w,delta,rc,ptr);
[r,c]=modify_Hilbert2D(hh-h,ww-w); rc=[r;c];
[qc(h+1:hh,w+1:ww),ptr]=de_sub2d(binary,hh-h,ww-w,delta,rc,ptr);

%fprintf('Decoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
[r1,c1]=modify_Hilbert2D(h,ww-w); qsb1=zeros(h,ww-w); len1=length(r1);
[r2,c2]=modify_Hilbert2D(hh-h,ww-w); qsb2=zeros(hh-h,ww-w); len2=length(r2);
[r3,c3]=modify_Hilbert2D(hh-h,w); qsb3=zeros(hh-h,w); len3=length(r3);
[qsb,ptr]=de_sub2d(binary,0,0,delta,[r1 r2 r3],ptr);
for ia=1:len1,   qsb1(r1(ia),c1(ia))=qsb(ia);   end
qc(1:h,w+1:ww)=qsb1;
tem=qsb(len1+1:len1+len2); for ia=1:len2,   qsb2(r2(ia),c2(ia))=tem(ia);   end
qc(h+1:hh,w+1:ww)=qsb2;
tem=qsb(len1+len2+1:len1+len2+len3); for ia=1:len3,   qsb3(r3(ia),c3(ia))=tem(ia);   end
qc(h+1:hh,1:w)=qsb3;

%fprintf('Decoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
hh=h; h=hh-bitshift(hh,-1); ww=w; w=ww-bitshift(ww,-1);
[r1,c1]=modify_Hilbert2D(h,ww-w); qsb1=zeros(h,ww-w); len1=length(r1);
[r2,c2]=modify_Hilbert2D(hh-h,ww-w); qsb2=zeros(hh-h,ww-w); len2=length(r2);
[r3,c3]=modify_Hilbert2D(hh-h,w); qsb3=zeros(hh-h,w); len3=length(r3);
[qsb,ptr]=de_sub2d(binary,0,0,delta,[r1 r2 r3],ptr);
for ia=1:len1,   qsb1(r1(ia),c1(ia))=qsb(ia);   end
qc(1:h,w+1:ww)=qsb1;
tem=qsb(len1+1:len1+len2); for ia=1:len2,   qsb2(r2(ia),c2(ia))=tem(ia);   end
qc(h+1:hh,w+1:ww)=qsb2;
tem=qsb(len1+len2+1:len1+len2+len3); for ia=1:len3,   qsb3(r3(ia),c3(ia))=tem(ia);   end
qc(h+1:hh,1:w)=qsb3;

%fprintf('Decoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
lev=6; %<====================================
D=2^lev;
%maxc = 255 * D /delta; maxc=round(1.1*maxc); offset=0;
maxc = 255 * D /delta; maxc=round(1.2*maxc); offset=0; %modified Nov 4, 2020
if binary(ptr)~=0
   ptr=ptr+1;
   %offset=bin2dec(char( binary(ptr:ptr+3)+48 ))*D; ptr=ptr+4;
   %offset=bin2dec(char( binary(ptr:ptr+4)+48 ))*D; ptr=ptr+5; %modified Oct 23, 2020
   %====================== modified Nov 4, 2020 ====================================================================
   offset=bin2dec(char( binary(ptr:ptr+6)+48 ))*D; ptr=ptr+7; 
   maxc0=maxc+ceil(offset/delta); %<===================
   [maxc,ptr] = deSFcode(binary,maxc0,ptr);   
   %====================== modified Nov 4, 2020 ====================================================================
else
   ptr=ptr+1;
end

sdc=zeros(h,w);
for ia=1:h
   for ib=1:w
      [sdc(ia,ib),ptr] = deSFcode(binary,maxc,ptr);
   end
end
qc(1:h,1:w)=(sdc-1)*delta - offset;
