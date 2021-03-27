function [idx,r,lB,pr,nr,sumcr,sumcrc,cf1,cf1k,nc1,nc1k,z1] = find_thd4subs(cf0,thd_arr,nc,idx0)

p=0.5;
idx=find_thd_idx_round(nc,p,thd_arr);


%modified 24/04/2015 ----------------------------------------------------
%idx=max([idx idx0]);
if idx0>idx && thd_arr(idx+1)<length(nc)
   idx=idx+1;
end
%------------------------------------------------------------------------

   
thd=thd_arr(idx); %%%%%%%%%%%%%%%%%
[z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
[cr,crc,r,lB,pr,nr]=k_criterion(z1);   [cri,crci,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
%[cr cri],pr %%%%%%%%%%%%%

sumcr0=0; sumcr=cr+cri; sumcrc = crc + crci;
flg=0;  max_idx=numel(thd_arr);
while sumcr>sumcr0  &&  sum(nc1k)/sum(nc)<0.86  &&  idx<max_idx  &&  thd_arr(idx+1)<length(nc) 
   flg=1;
   sumcr0=sumcr;   sumcrc0=sumcrc; 
   idx=idx+1; thd=thd_arr(idx);
   [z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
   [cr,crc,r,lB,pr,nr]=k_criterion(z1);   [cri,crci,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
   sumcr = cr + cri;  sumcrc = crc + crci;
end
if flg==1
   idx=idx-1; thd=thd_arr(idx);
   [z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
   [cr,crc,r,lB,pr,nr]=k_criterion(z1);   [cri,crci,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
   %[cr cri],pr %%%%%%%%%%%%%
   sumcr = cr + cri;  sumcrc = crc + crci;
end

%thdddddddddddd=thd
