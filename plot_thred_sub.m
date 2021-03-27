function T3=plot_thred_sub(p)

alpha1=-log(p);
[T1,h]=find_thred_laplace(alpha1);
p1=exp(-alpha1*T1);

if p1>p
   alpha2=1.6*alpha1;
else
   alpha2=0.7*alpha1;
end
[T2,h]=find_thred_laplace(alpha2);
p2=exp(-alpha2*T2);
T3=T2;

ia=1; dif=abs((p2-p)/p);
while dif>0.0001
%for ia=1:10
%   fprintf('===============================\n\n')
 %  ia
   alpha3 = (alpha2-alpha1)/(p2-p1)*(p-p2) +alpha2;
   [T3,h]=find_thred_laplace(alpha3);
   p3=exp(-alpha3*T3);
      
   p1=p2; p2=p3; alpha1=alpha2; alpha2=alpha3;
   dif=abs((p2-p)/p);
   ia=ia+1;   
end
%ia %%%%%%%%%%%%%%%%%%%%%
