function a=dy79recon_4lev_PlusCFP2(coef)

N=size(coef); hN=N/2; qN=N/4; hqN=N/8; qqN=N/16; %hqqN=N/32; qqqN=N/64;
coef=double(coef);

%-----------------------------------------------------------------------------
w=qqN; 
b=coef(1:w(1),1:w(2));
Lev=2;, tanTheta=0.125;
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


qbh=coef(1:hN(1), hN(2)+1:N(2));
qbv=coef(hN(1)+1:N(1), 1:hN(2));
qbd=coef(hN(1)+1:N(1), hN(2)+1:N(2));

qbh2=coef(1:qN(1), qN(2)+1:hN(2));
qbv2=coef(qN(1)+1:hN(1), 1:qN(2));
qbd2=coef(qN(1)+1:hN(1), qN(2)+1:hN(2));

qbh3=coef(1:hqN(1), hqN(2)+1:qN(2));
qbv3=coef(hqN(1)+1:qN(1), 1:hqN(2));
qbd3=coef(hqN(1)+1:qN(1), hqN(2)+1:qN(2));

qba4=coef(1:qqN(1), 1:qqN(2));
qbh4=coef(1:qqN(1), qqN(2)+1:hqN(2));
qbv4=coef(qqN(1)+1:hqN(1), 1:qqN(2));
qbd4=coef(qqN(1)+1:hqN(1), qqN(2)+1:hqN(2));

qbaa3=ib44int(qba4, qbv4, qbh4, qbd4);
qbaa2=ib44int(qbaa3, qbv3, qbh3, qbd3);
qbaa=ib44int(qbaa2, qbv2, qbh2, qbd2);
a=ib44int(qbaa, qbv, qbh, qbd);
