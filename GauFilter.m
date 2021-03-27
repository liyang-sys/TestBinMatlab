function [H,width,He]=GauFilter(cut,N)

ru2=sqrt(2); ru2i=1/ru2;

He=exp(-cut*cut);
%tail=sqrt(2)/1.07; htail=1/tail;
tail=sqrt(2)/1.09; htail=1/tail;
x0=sqrt(log(tail));
xLe=x0-(cut-x0);
xh=(x0+cut)/2;

width=2*(cut-x0); dta=width/N;

t=[0:dta:width]; x=t+xLe;
len=length(x); hlen=floor(len/2);
xL=x(1:hlen); xR=x(hlen+1:len);
HR=exp(-xR.^2);    HR=(HR-He)*(htail/(htail-He))*(ru2i/htail);
HL=sqrt(1-fliplr(HR(2:hlen+1)).^2);

H=[HL HR];

%figure;
%plot(x,H); hold on; plot([x0 x0],[0 1]); axis([-cut cut -0.05 1.05]); grid on;
%plot([xLe xLe],[0 1],'k'); plot([xh xh],[0 1],'r'); %plot(x,H,'r.');