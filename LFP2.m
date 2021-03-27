function [coef,fL]=LFP2(a,w)

[coef,fL1]=LFP2sub(a,w);
coef=coef';
[coef,fL2]=LFP2sub(coef,w);
coef=coef';

N=size(a);
if N(2)>N(1)
   fL=fL1;
else
   fL=fL2;
end