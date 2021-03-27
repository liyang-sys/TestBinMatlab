function a=LFP2subInv(coef,w,fL) %'a' is the input matrix

[N,N1]=size(coef); hN=N/2; w2=2*w; hM=N/w2;

fH=flipud(fL);

coef(1:w,:)=idct(coef(1:w,:));
for ia=w+1:w:N-w
   coef(ia:ia+w-1,:)=dct(coef(ia:ia+w-1,:));
end
coef(N-w+1:N,:)=idct(coef(N-w+1:N,:));

a=coef;

TopAdjust = fH(w+1:w2-1,:) + flipud(fH(1:w-1,:));
coef(2:w,:)=coef(2:w,:).*TopAdjust;
BottomAdjust = fL(2:w,:) - flipud(fL(w+2:w2,:));
coef(N-w+2:N,:)=coef(N-w+2:N,:).*BottomAdjust;

tem=coef(2:w,:).*fH(1:w-1,:);
coef(w+2:w2,:)=(coef(w+2:w2,:)-flipud(tem)) ./fH(w+1:w2-1,:);
tem=coef(N-w+2:N,:).*fL(w+2:w2,:);
coef(N-w2+2:N-w,:)=(coef(N-w2+2:N-w,:)+flipud(tem)) ./fL(2:w,:);

for ia=2:hM-1
   st=(ia-1)*w2+1; et=ia*w2;
   coef(st:et,:)=iLapProj(coef(st:et,:),fL,fH);
end
for ia=1:hM-1
   st=(2*ia-1)*w+1; et=(2*ia+1)*w;
   coef(st:et,:)=iLapProj(coef(st:et,:),fL,fH);
end

a(w+1:N-w,:)=coef(w+1:N-w,:);
