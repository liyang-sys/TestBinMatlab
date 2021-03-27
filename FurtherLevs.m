function b=furtherLevs(a,M,Lev,tanTheta)

N=size(a);  w=floor(N/M);

b=a;

%---------------------------------------------------------------------
H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=1:Lev
   b(1:H(ia),1:W(ia))=CFP2bd(b(1:H(ia),1:W(ia)),tanTheta);
   b(1:H(ia),1:W(ia))=block2LowHigh(b(1:H(ia),1:W(ia)));
end
