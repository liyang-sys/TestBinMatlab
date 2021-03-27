function [r,lB,nr,maxcr,maxcr_count,cf1,nc1,cf2,nc2,z,cr,cri,pr]=cr_test(cf,thd,nc)

[z,cf2,cf1]=separate(cf,thd);  cf2=cf2-thd;  nc2=nc(thd+1:length(nc));  nc1=nc(1:thd);
[cr,k,r,lB,pr,nr,cr_count]=k_criterion(z);   

[cri,ki,ri,lBi,pri,nri,cri_count]=k_criterion(1-z);   maxcr=max([cr cri]);

maxcr_count=max([cr_count cri_count]);
