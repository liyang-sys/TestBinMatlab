function b=CFP2_1D(a,tanTheta)

hlen=size(a,1)/2; 
if 2*ceil(hlen/2)-hlen>0.1
   b=CFP2bandDecomSub2(a,tanTheta);
else
   b=CFP2bandDecomSub1(a,tanTheta);
end

N=size(a); hN=N/2;
a=b;
b(1:hN(1),:)=a(1:2:N(1),:); b(hN(1)+1:N(1),:)=a(2:2:N(1),:);
