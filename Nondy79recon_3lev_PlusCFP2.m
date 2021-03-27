function coef=Nondy79recon_3lev_PlusCFP2(coef)

N=size(coef); hN=N/2; qN=N/4; hqN=N/8; %qqN=N/16; %hqqN=N/32; qqqN=N/64;
coef=double(coef);

%-----------------------------------------------------------------------------
w=hqN; 
b=coef(1:w(1),1:w(2));
Lev=3;, tanTheta=0.125;
H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=Lev:-1:1
   b(1:H(ia),1:W(ia))=LowHigh2block(b(1:H(ia),1:W(ia)));
   b(1:H(ia),1:W(ia))=CFP2bdInv(b(1:H(ia),1:W(ia)),tanTheta);
end
coef(1:w(1),1:w(2))=b;
%-----------------------------------------------------------------------------

coef=dy97recon1D(coef,3);
coef=dy97recon1D(coef',3)';
