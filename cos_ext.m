function [coef,coef0]=cos_ext(a,M,thetaM,s)

hM=M/2; Md=M-1;
[H,W]=size(a);

coef=a;
for ia=hM+1:M:W-M
   for ib=1:H
      coef(ia:ia+Md,ib)=prefilter0(a(ia:ia+Md,ib),thetaM,s);
   end
end
coef=coef';
for ia=hM+1:M:W-M
   for ib=1:H
      coef(ia:ia+Md,ib)=prefilter0(coef(ia:ia+Md,ib),thetaM,s);
   end
end
coef0=coef';

coef=dctM(coef0,M);
