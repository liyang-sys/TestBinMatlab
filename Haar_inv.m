function b=Haar_inv(a)

N=size(a); hN=N/2; ru2=sqrt(2);

b=a;
b(1:2:N(1),:,:)=(a(1:hN(1),:,:)+a(hN(1)+1:N(1),:,:))/ru2;
b(2:2:N(1),:,:)=(a(1:hN(1),:,:)-a(hN(1)+1:N(1),:,:))/ru2;
