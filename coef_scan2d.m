function cf=coef_scan2d(coef,routxy)

%load H2ext
len=numel(coef);
cf=zeros(1,len);
for n=1:len
   cf(n)=coef(routxy(1,n),routxy(2,n));
end
