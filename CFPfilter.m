function [H,H0]=CFPfilter(N)

ru2=sqrt(2); ru2i=1/ru2; hN=N/2;

H0=extMeyer(N,0,'3b',3); HR=H0(hN+1:N+1); %%%%%%%%%%%%%%%

n=floor((hN-0.00001)/2); 
fHR=fliplr(HR(hN-n+1:hN));
theta2=acos(fHR); 
alpha=fliplr((pi/2)*[hN-n:hN-1]/hN);
theta1=(theta2-(alpha-pi/4));

HR(2:1+n)=cos(theta1);

HL=sqrt(1-fliplr(HR(2:hN+1)).^2);

H=[HL HR];

%figure;
%plot(x,H,x,H,'r.'); hold on; plot([x0 x0],[0 1]); axis([-cut cut -0.05 1.05]); grid on;
%plot([xLe xLe],[0 1],'k'); plot([xh xh],[0 1],'r'); %plot(x,H,'r.');