function b=CFP2bandRe(a,tanTheta)

[H,W]=size(a); hH=H/2; 
if H-floor(hH)*2>0.1 %odd length
   if 2*ceil(ceil(hH)/2)-ceil(hH)>0.1
      b=CFP2bandReconSub2([a; zeros(1,W)],tanTheta);
      b=b(1:H,:);
   else
      b=CFP2bandReconSub1a([a; zeros(1,W)],tanTheta);
      b=b(1:H,:);
   end
else %even length
   if 2*ceil(hH/2)-hH>0.1
      b=CFP2bandReconSub2(a,tanTheta);
   else
      b=CFP2bandReconSub1a(a,tanTheta);
   end
end
