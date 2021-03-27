function [coef,coef0]=pre3_ext(a)

S=[4/3  8/7  8/7  8/7]';   P=[-3/8  -1/4  -1/16]';   U=[3/4  1/2  1/4]';
[H,W]=size(a);

coef=a;
for ia=5:8:W-8
   coef(ia:ia+7,:)=prefilter3(a(ia:ia+7,:),S,P,U);
end
coef=coef';
for ia=5:8:H-8
   coef(ia:ia+7,:)=prefilter3(coef(ia:ia+7,:),S,P,U);
end
coef0=coef';
coef=dctM(coef0,8);
