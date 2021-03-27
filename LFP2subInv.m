function a=LFP2subInv(coef,w,fL) %'a' is the input matrix

[H,W]=size(coef); w2=2*w;
fH=flipud(fL);

coef(1:w,:)=idct(coef(1:w,:));
for ia=w+1:w:H-w
   coef(ia:ia+w-1,:)=dct(coef(ia:ia+w-1,:));
end
coef(H-w+1:H,:)=idct(coef(H-w+1:H,:));
a=coef;

%modified (added) on Oct 23, 2017. =============================================
TopAdjust = fH(w+1:w2-1,:) + flipud(fH(1:w-1,:));
coef(2:w,:)=coef(2:w,:).*TopAdjust;

tem=coef(2:w,:).*fH(1:w-1,:);
coef(w+2:w2,:)=(coef(w+2:w2,:)-flipud(tem)) ./fH(w+1:w2-1,:);

if floor(H/w2)*w2 ~= H
   hM2=(H+w)/w2; hM1=hM2-1;
else
   hM2=H/w2; hM1=hM2;

   BottomAdjust = fL(2:w,:) - flipud(fL(w+2:w2,:));
   coef(H-w+2:H,:)=coef(H-w+2:H,:).*BottomAdjust;

   tem=coef(H-w+2:H,:).*fL(w+2:w2,:);
   coef(H-w2+2:H-w,:)=(coef(H-w2+2:H-w,:)+flipud(tem)) ./fL(2:w,:);
end
%===============================================================================

for ia=2:hM2-1
   st=(ia-1)*w2+1; et=ia*w2;
   coef(st:et,:)=iLapProj(coef(st:et,:),fL,fH);
end
for ia=1:hM1-1
   st=(2*ia-1)*w+1; et=(2*ia+1)*w;
   coef(st:et,:)=iLapProj(coef(st:et,:),fL,fH);
end

%modified (added) on Oct 23, 2017. =============================================
if floor(H/w2)*w2 ~= H
   tem=coef(H-w+2:H,:).*fL(w+2:w2,:);
   coef(H-w2+2:H-w,:)=(coef(H-w2+2:H-w,:)+flipud(tem)) ./fL(2:w,:);
end
%===============================================================================

a(w+1:H-w,:)=coef(w+1:H-w,:);
