function [T,h]=find_thred_laplace(alpha)

ctr=centr_weight_laplace(alpha);
T0=1-ctr;

h=esti_quant_size_laplace(alpha);

T=T0*h;