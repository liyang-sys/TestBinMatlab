function coef=dy79decm_4lev_PlusCFP2(a)
%dyadic decomposition using 7/9 filters

[ba, bv, bh, bd]=b44int(double(a));
[ba2, bv2, bh2, bd2]=b44int(ba);
[ba3, bv3, bh3, bd3]=b44int(ba2);
[ba4, bv4, bh4, bd4]=b44int(ba3);

%---------------------------------------------------------------------
Lev=2;
w=size(ba4);
H=zeros(1,Lev); W=H; tanTheta=0.125;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=1:Lev
   ba4(1:H(ia),1:W(ia))=CFP2bd(ba4(1:H(ia),1:W(ia)),tanTheta);
   ba4(1:H(ia),1:W(ia))=block2LowHigh(ba4(1:H(ia),1:W(ia)));
end
%---------------------------------------------------------------------

l4=[ba4 bh4; bv4 bd4];
l3=[l4 bh3; bv3 bd3];
l2=[l3 bh2; bv2 bd2];
coef=[l2 bh; bv bd];
