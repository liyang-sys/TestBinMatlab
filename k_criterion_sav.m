function [cr,k]=k_criterion(z)

z=double(z);
if max(z)==1
   %[r,lB,p]=golomb0(z); N0=length(z);
   [r,lB,p]=golomb0(z); N0=length(r);
else
   %r=z; N0=sum(r); p=length(r)/N0;
   r=z; N0=length(r); p=N0/sum(r);
end
nc=hist(r, [1:max(r)]);

k=floor(-log(N0)/log(1-p));
cr=sum(nc(k+1:length(nc)));
