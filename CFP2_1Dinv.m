function b=CFP2_1Dinv(a,tanTheta)

N=size(a); hN=N/2;
b(1:2:N(1),:)=a(1:hN(1),:);  b(2:2:N(1),:)=a(hN(1)+1:N(1),:);
a=b;

hlen=size(a,1)/2; 
if 2*ceil(hlen/2)-hlen>0.1
   b=CFP2bandReconSub2(a,tanTheta);
else
   b=CFP2bandReconSub1(a,tanTheta);
end
