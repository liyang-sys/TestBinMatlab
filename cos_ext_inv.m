function b=cos_ext_inv(coef,M,thetaM,s)

hM=M/2; Md=M-1;
[H,W]=size(coef);

b=dctMinv(coef,M); 
for ia=hM+1:M:W-M
   for ib=1:H
      b(ia:ia+Md,ib)=prefilter0inv(b(ia:ia+Md,ib),thetaM,s);
   end
end
b=b';
for ia=hM+1:M:W-M
   for ib=1:H
      b(ia:ia+Md,ib)=prefilter0inv(b(ia:ia+Md,ib),thetaM,s);
   end
end
b=b';
