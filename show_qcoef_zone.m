function show_qcoef_zone(coef,Nbands)

N=size(coef);
coef=abs(sign(coef));
for ia=1:N(1)/Nbands
   for ib=1:N(2)/Nbands
      coef((ia-1)*Nbands+1, (ib-1)*Nbands+1)=0.5;
   end
end

figure; imshow(coef); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
