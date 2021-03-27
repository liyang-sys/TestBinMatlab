function [L,H]=De97Sym(A)

hlen=length(A)/2; lenL=ceil(hlen); lenH=floor(hlen); 

[L,H]=dwt(A,'bior4.4','mode','symw'); %%%%%%%%%%%%%%%%%%
L=L(3:2+lenL); H=H(3:2+lenH);
