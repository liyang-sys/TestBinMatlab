function fontexample()

%*******************  Important Graghics Commands  **********************


set(gcf,'DefaultAxesLineWidth',1.5);
set(gcf,'DefaultLineLineWidth',1.25);
set(gcf,'DefaultAxesTickLength',[0.02 0.025]);
set(gcf,'DefaultTextFontSize',16);
set(gcf,'DefaultAxesFontSize',16);
set(gcf,'DefaultLineMarkerSize',35); %plot symbol size control

%set(gca,'XTick',[0:0.25:1]);
%set(gca,'XTicklabel',['  0 ';'0.25';'0.5 ';'0.75';' 1  ']);


axes('position', [0.1 0.15 0.4 0.4]);



%plot(0,0,'x', 'MarkerSize',15) <========== marker (symbol) size control here !!!!!!!



t=[0:0.0001:1]; p=t;
plot(t,p,'k');
hold on;
ymax=1.1*max(p);
axis([0 1 0 ymax]);

x3=[0.2 0.3 0.5 0.8];
stem(x3, ones(1,4)*10, 'k');
ylabel('{\itp}({\itx})');
xlabel('\itx');
title('{\itN} = 3,  {\itH}_0 = 1.0461');

%set(gca,'LineWidth',5);	
%set(gca,'TickLength',[0.05,0.025]);

hold off;



subplot(2,2,2),
axis([0 1 0 1]);
hold on;
ymax=1.1*max(p);
axis([0 1 0 ymax]);
%stem(x7, ones(1,8)*10, 'k');
ylabel('p(x)');
xlabel('x');

text(0.05, 0.2, '\int  ','FontSize', 22);
text(0.1, 0.2, '^{\itb}_{\ita}');
text(0.15, 0.2, '{\itN }^{\bf2}{\itdx} = 7'); axis('off');
%text(0.69, 1.7, '22 00', 'FontSize', 13);

text(0.3, 0.78, '\Sigma','FontSize', 27); text(0.4, 0.8,'{\ita}\times{\itb\sigma}^2')
text(0.32, 0.68, '\infty');

text(0.1,0.5,'\Uparrow','FontSize', 50)

title('\itN {\rm= 4,}   H {\rm_0 = 2.0599}');
%set(gca, 'FontAngle', 'normal');
text(0, 0.9, '\in');
hold off;

%print -r300 -dtiff test
