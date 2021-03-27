clc;

h=-1:0.0001:255;
% f=1;
% f1=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;
% f=0.9;
% f09=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;
% f=0.8;
% f08=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;
% f=0.5;
% f05=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;
% f=0.2;
% f02=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;
f=0;
f0=h*f+(1-f)*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;

% h=0:0.0001:624;
% f0=(1-lav^m./((h).^(1/2.2)+lav^m))*255.0;
% fig=figure;
plot(h,f0,'r'); hold on;

% h=0:0.001:255;
% out=h./256;
% in=(lav^m*out./(1-out)).^2.2;
% % it=lav^m*out./(1-out);
% plot(h,in);

% plot(h,f02,'g'); hold on;
% plot(h,f05,'b'); hold on;
% plot(h,f08,'c'); hold on;
% plot(h,f09,'m'); hold on;
% plot(h,f1,'k'); hold off;
% title('不同f值，ToneMapping对比图（原图为memorial.o876）'); xlabel('HDR(0~255)'); ylabel('LDR(0~255)');
% legend({'f=0', 'f=0.2','f=0.5','f=0.8', 'f=0.9','f=1'}, 'Location', 'SouthEast');