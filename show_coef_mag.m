function show_coef_mag(coef,Nbands)

coef=abs(coef);
N=size(coef);

for ia=1:N(1)/Nbands
   for ib=1:N(2)/Nbands
      coef((ia-1)*Nbands+1, (ib-1)*Nbands+1)=1;
   end
end

for ia=1:N(1)
   for ib=1:N(2)
      if  coef(ia,ib)<1,  coef(ia,ib)=1;  end
   end
end

%coef=log(coef);
%coef=sqrt(coef);
coef=coef.^(0.7);

coef=coef/max(max(coef));

figure; imshow(coef);
