function [Nnon,zone,subzone,subcoef]=Coef_Statistics_5lev(coef)

n=size(coef)/2;

zone=uint8(abs(sign(double(coef))));
Nnon=zeros(7,4);
subzone=cell(6,3);
subcoef=cell(9,3);
for ia=1:5
   subzone{ia,1}=zone(1:n(1),n(2)+1:2*n(2));
   subcoef{ia,1}=coef(1:n(1),n(2)+1:2*n(2));
   Nnon(ia,1)=sum(sum(subzone{ia,1}));
   subzone{ia,2}=zone(n(1)+1:2*n(1),1:n(2));
   subcoef{ia,2}=coef(n(1)+1:2*n(1),1:n(2));
   Nnon(ia,2)=sum(sum(subzone{ia,2}));
   subzone{ia,3}=zone(n(1)+1:2*n(1),n(2)+1:2*n(2));
   subcoef{ia,3}=coef(n(1)+1:2*n(1),n(2)+1:2*n(2));
   Nnon(ia,3)=sum(sum(subzone{ia,3}));
   
   Nnon(ia,4)=sum(Nnon(ia,1:3));
   n=n/2;
end
Nnon(7,:)=sum(Nnon,1);


n=n*2; subcoef{7,1}=coef(1:n(1),1:n(2));

n=n*2; subcoef{8,1}=coef(1:n(1),1:n(2));
n=n*2; subcoef{8,2}=coef(1:n(1),1:n(2));
n=n*2; subcoef{8,3}=coef(1:n(1),1:n(2));
n=n*2; subcoef{9,1}=coef(1:n(1),1:n(2));
n=n*2; subcoef{9,2}=coef(1:n(1),1:n(2));

%max(max(subcoef{1,1})), min(min(subcoef{1,1})), %%%%%%%%%%%%%%%%%%%%%%%%
