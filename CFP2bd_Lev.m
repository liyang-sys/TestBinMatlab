function a=CFP2bd_Lev(a,Lev)
w=size(a);
H=zeros(1,Lev); W=H; tanTheta=0.125;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=1:Lev
   a(1:H(ia),1:W(ia))=CFP2bd(a(1:H(ia),1:W(ia)),tanTheta);
   a(1:H(ia),1:W(ia))=block2LowHigh(a(1:H(ia),1:W(ia)));
end
