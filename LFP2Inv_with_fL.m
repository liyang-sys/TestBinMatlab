function a=LFP2Inv_with_fL(coef,w)

[H,W]=size(coef); w2=2*w;

if w2==4
   ftrL=CFPfilter2B';
elseif w2==8
   ftrL=CFPfilter4B';
elseif w2==12
   ftrL=CFPfilter6B';
elseif w2==16
   ftrL=CFPfilter8B';
else
   ftrL=CFPfilter(w2)';
end

HW=max([H W]);
fL=zeros(w2,HW);
tem1=ftrL(1:w2);   for ia=1:HW, fL(:,ia)=tem1; end

a=LFP2subInv(coef,w,fL(:,1:W));
a=a';
a=LFP2subInv(a,w,fL(:,1:H));
a=a';
