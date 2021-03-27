function [coef,fL]=LFP2(a,w)

N=size(a);

k=N(2)/64;
coef=zeros(N);
for ia=1:k
   idx = (ia-1)*64+1 : ia*64;
   [coef(:,idx),fL1]=LFP2sub(a(:,idx) ,w);
end

coef=coef';

k=N(1)/64;
for ia=1:k
   idx = (ia-1)*64+1 : ia*64;
   [coef(:,idx),fL2]=LFP2sub(coef(:,idx) ,w);
end

coef=coef';


if N(2)>N(1)
   fL=fL1;
else
   fL=fL2;
end
