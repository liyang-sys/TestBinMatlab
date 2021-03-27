function [subcoef]=subbands(coef,ns)

N=size(coef);
Ns=N/ns;

subcoef=cell(ns,ns);

for iy=1:ns
   for ix=1:ns
      subcoef{iy,ix}=coef( (iy-1)*Ns(1)+1:iy*Ns(1), (ix-1)*Ns(2)+1:ix*Ns(2) ); 
   end
end
