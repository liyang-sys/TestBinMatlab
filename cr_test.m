function [r,lB,nr,sumcr,sumcrc,cf1,nc1,cf2,nc2,z,pr,cr,cri]=cr_test(cf,thd,nc)

[z,cf2,cf1]=separate(cf,thd);  cf2=cf2-thd;  nc2=nc(thd+1:length(nc));  nc1=nc(1:thd);

[cr,cr_count,r,lB,pr,nr,k]=k_criterion(z);   
[cri,cri_count,ri,lBi,pri,nri,ki]=k_criterion(1-z);   

sumcr = cr + cri;
sumcrc = cr_count + cri_count;
