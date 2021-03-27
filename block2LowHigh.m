function b=block2LowHigh(a)

N=size(a);  hN=ceil(N/2);

b=a;
b(1:hN(1),:)=a(1:2:N(1),:);
b(hN(1)+1:N(1),:)=a(2:2:N(1),:);
a=b;
b(:,1:hN(2))=a(:,1:2:N(2));
b(:,hN(2)+1:N(2))=a(:,2:2:N(2));
