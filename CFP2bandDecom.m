function b=CFP2bandDecom(a,tanTheta)

hlen=size(a,1)/2; 
if 2*ceil(hlen/2)-hlen>0.1
   b=CFP2bandDecomSub2(a,tanTheta);
else
   b=CFP2bandDecomSub1(a,tanTheta);
end
