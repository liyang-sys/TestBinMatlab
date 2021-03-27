function b=CFP2bandRecon(a,tanTheta)

hlen=size(a,1)/2; 
if 2*ceil(hlen/2)-hlen>0.1
   b=CFP2bandReconSub2(a,tanTheta);
else
   b=CFP2bandReconSub1(a,tanTheta);
end
