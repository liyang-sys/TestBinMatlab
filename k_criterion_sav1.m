function [cr,cr_count,r,lB,p,nc,k]=k_criterion(z)

z=double(z);
if max(z)==1
   [r,lB,p]=Golomb0(z); N0=length(r);
else
   r=z; N0=length(r); p=N0/sum(r); lB=0;
end
q=1-p;
nc=hist(r, [1:max(r)]);

k=floor(-log(N0)/log(q));

cr_count=sum(nc(k+1:length(nc)));

cr=0; dn=0;
for n=k+1:length(nc)
   if nc(n)>0
      if dn==0
         an=nc(n)/N0;   cr = cr + log(an/p) -(n-1)*log(q) ;
      else
         an=(nc(n)/N0)/(dn+1);   cr = cr + log(an/p) -(n-1-ceil(dn/2))*log(q) ;
      end
      dn=0;
   else
      dn=dn+1;
   end
end
