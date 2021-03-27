function absqcf=coef_scan3d_inv(cf0,n)

len=length(n);
N=zeros(1,3); N(1)=max(n(1,:)); N(2)=max(n(2,:)); N(3)=max(n(3,:));
absqcf=zeros(N);
for ia=1:len
   absqcf(n(1,ia),n(2,ia),n(3,ia))=cf0(ia);
end
