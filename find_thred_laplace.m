function [T,h]=find_thred_laplace(alpha)

h=esti_quant_size_laplace(alpha);

ctr=centr_weight_laplace(alpha*h);
T0=1-ctr;

T=T0*h;