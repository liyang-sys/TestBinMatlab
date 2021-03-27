function b=Haar(a)

N=size(a); hN=N/2; ru2=sqrt(2);

b=a;
b(1:hN(1),:,:)=(a(1:2:N(1),:,:)+a(2:2:N(1),:,:))/ru2;
b(hN(1)+1:N(1),:,:)=(a(1:2:N(1),:,:)-a(2:2:N(1),:,:))/ru2;
