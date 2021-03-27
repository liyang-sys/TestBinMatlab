function [lo,hi]=decm26(a)

ru2=sqrt(2);
len=size(a,1);
a=[flipud(a(1:2,:)); a; flipud(a(len-1:len,:))]; %%%%%%

len=len+4; hlen=len/2; hlend=hlen-1;
b=a(1:2:len,:) +a(2:2:len,:); b8=b/8;
c=a(1:2:len,:) -a(2:2:len,:); %c8=c/8;

lo=b(2:hlend,:)/ru2;
hi=(c(2:hlend,:) -b8(1:hlen-2,:) +b8(3:hlen,:))/ru2;
