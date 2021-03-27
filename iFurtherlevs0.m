function b=iFurtherLevs(a,M,Lev,tanTheta)

N=size(a);  w=floor(N/M);  md=N-M*w; 

b=a;
%-----------------------------------------------------------------------------

H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=Lev:-1:1
   b(1:H(ia),1:W(ia))=LowHigh2block(b(1:H(ia),1:W(ia)));
   b(1:H(ia),1:W(ia))=CFP2bdInv(b(1:H(ia),1:W(ia)),tanTheta);
end
