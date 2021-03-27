function [coef,fL]=LFP2sub(a,w) %'a' is the input matrix

[N,N1]=size(a); hN=N/2; w2=2*w; hM=N/w2;

if w2==4
   ftrL=CFPfilter2B';
elseif w2==8
   ftrL=CFPfilter4B';
elseif w2==12
   ftrL=CFPfilter6B';
elseif w2==16
   ftrL=CFPfilter8B';
else
   %ftrL=CFPfilterT(1.75,w2)';
   ftrL=CFPfilter(w2)';
end

fL=zeros(w2,N1);
tem1=ftrL(1:w2);   for ia=1:N1, fL(:,ia)=tem1; end
fH=flipud(fL);

coef=a;

TopAdjust = fH(w+1:w2-1,:) + flipud(fH(1:w-1,:));
coef(2:w,:)=coef(2:w,:).*TopAdjust;
BottomAdjust = fL(2:w,:) - flipud(fL(w+2:w2,:));
coef(N-w+2:N,:)=coef(N-w+2:N,:).*BottomAdjust;

for ia=1:hM-1
   st=(2*ia-1)*w+1; et=(2*ia+1)*w;
   coef(st:et,:)=LapProj(coef(st:et,:),fL,fH);
end
for ia=1:hM
   st=(ia-1)*w2+1; et=ia*w2;
   coef(st:et,:)=LapProj(coef(st:et,:),fL,fH);
end

coef(1:w,:)=dct(a(1:w,:));
for ia=w+1:w:N-w
   coef(ia:ia+w-1,:)=idct(coef(ia:ia+w-1,:));
end
coef(N-w+1:N,:)=dct(a(N-w+1:N,:));
