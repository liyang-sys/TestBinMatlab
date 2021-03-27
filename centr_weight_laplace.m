function c=centr_weight_laplace(alpha)

e_al=exp(-alpha);
c=(1-e_al-alpha.*e_al)./(1-e_al)./alpha;
