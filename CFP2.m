function b=CFP2(a)

N=size(a); hN=N/2;
b=CFP2bandDecom(a,0.125);

a=b;
b(1:hN(1),:)=a(1:2:N(1),:);
b(hN(1)+1:N(1),:)=a(2:2:N(1),:);
