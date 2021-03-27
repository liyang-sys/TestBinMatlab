function [coef,fL]=LFP2sub(a,w) %'a' is the input matrix

[H,W]=size(a); w2=2*w;

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

fL=zeros(w2,W);
tem1=ftrL(1:w2);   for ia=1:W, fL(:,ia)=tem1; end
fH=flipud(fL);

coef=a;

%modified (added) on Oct 23, 2017. =============================================
if floor(H/w2)*w2 ~= H
   hM2=(H-w)/w2; hM1=hM2;

   TopAdjust = fH(w+1:w2-1,:) + flipud(fH(1:w-1,:));
   coef(2:w,:)=coef(2:w,:).*TopAdjust;
else
   hM2=H/w2; hM1=hM2-1;

   TopAdjust = fH(w+1:w2-1,:) + flipud(fH(1:w-1,:));
   coef(2:w,:)=coef(2:w,:).*TopAdjust;
   BottomAdjust = fL(2:w,:) - flipud(fL(w+2:w2,:));
   coef(H-w+2:H,:)=coef(H-w+2:H,:).*BottomAdjust;
end
%===============================================================================

for ia=1:hM1
   st=(2*ia-1)*w+1; et=(2*ia+1)*w;
   coef(st:et,:)=LapProj(coef(st:et,:),fL,fH);
end
for ia=1:hM2
   st=(ia-1)*w2+1; et=ia*w2;
   coef(st:et,:)=LapProj(coef(st:et,:),fL,fH);
end

coef(1:w,:)=dct(a(1:w,:));  %DCT was used for the border, but reflection was ALSO needed for the
%structure. (The stucture was not necessary, but was not changed back because I didn't want to spend
%more time with no improvments. Yet, it turns out this is needed for sizes of odd multiples of w's!)
for ia=w+1:w:H-w
   coef(ia:ia+w-1,:)=idct(coef(ia:ia+w-1,:));
end
coef(H-w+1:H,:)=dct(a(H-w+1:H,:)); %DCT is used for the border, but reflection is STILL needed for the structure.
