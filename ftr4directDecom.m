function [ftrL,ftrH,ftrW]=ftr4directDecom(BWv,BWc,type,para)

switch type
   case 'frac'
      h=extMeyer1(BWv,0,'frac',1,para); %'para' is used as the power for this option
      ftrCore=h(2:BWv)';
   case 'Meyer'
      sm=smooth(BWv,para,5)'; ftrCore=cos(pi/2*sm(2:BWv));
   case 'LiDec'
      tem=LiDecayFilter(BWv)';  ftrCore=tem(2:BWv);
   case 'GaTop'
      tem=GaussianTop(BWv)';   ftrCore=tem(2:BWv);
   case 'Gauss'
      tem=GauFilter(para,BWv)';   ftrCore=tem(2:BWv);
end
ftrL=[ones(BWc,1); ftrCore; zeros(BWc,1)];
ftrH=flipud(ftrL);
ftrW=[ftrH; 1; ftrL];
