function b=CFP2bandDe(a,tanTheta)

len=size(a,1); hlen=len/2; 
if len-floor(hlen)*2>0.1 %odd length
   if 2*ceil(ceil(hlen)/2)-ceil(hlen)>0.1
      b=CFP2bandDecomOdd2(a,tanTheta);
   else
      b=CFP2bandDecomOdd1(a,tanTheta);
   end
else  %even length
   if 2*ceil(hlen/2)-hlen>0.1
      b=CFP2bandDecomSub2(a,tanTheta);
   else
      b=CFP2bandDecomSub1a(a,tanTheta);
   end
end
