function coef=coef_scan2d_inv(cf,h,w,routxy)

len=numel(cf);
coef=zeros(h,w);
for n=1:len
   coef(routxy(1,n),routxy(2,n))=cf(n);
end
