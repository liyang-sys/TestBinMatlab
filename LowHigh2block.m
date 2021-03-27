function b=LowHigh2block(a)

N=size(a);  hN=ceil(N/2);

b=a;
b(1:2:N(1),:)=a(1:hN(1),:);
b(2:2:N(1),:)=a(hN(1)+1:N(1),:);
a=b;
b(:,1:2:N(2))=a(:,1:hN(2));
b(:,2:2:N(2))=a(:,hN(2)+1:N(2));
