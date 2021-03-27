function a=Nondy79decm_3lev_PlusCFP2(a)

w=size(a); w=w/8;
a=dy97decom1D(a,3);  a=dy97decom1D(a',3)';
ba3=a(1:w(1),1:w(2));

%---------------------------------------------------------------------
Lev=3;
H=zeros(1,Lev); W=H; tanTheta=0.125;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=1:Lev
   ba3(1:H(ia),1:W(ia))=CFP2bd(ba3(1:H(ia),1:W(ia)),tanTheta);
   ba3(1:H(ia),1:W(ia))=block2LowHigh(ba3(1:H(ia),1:W(ia)));
end
%---------------------------------------------------------------------

a(1:w(1),1:w(2))=ba3;
