function [idx,r,lB,pr,nr,sumcr,sumcrc,cf1,cf1k,nc1,nc1k,z1] = find_thd4subbands(cf0,thd_arr,nc,p,p1,len_cf0)

idx=find_thd_idx_round(nc,p,thd_arr); thd=thd_arr(idx); %%%%%%%%%%%%%%%%%
[z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
[cr,crc,r,lB,pr,nr]=k_criterion(z1);   [cri,crci,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
%[cr cri],pr %%%%%%%%%%%%%

if maxcr<200
   idx=find_thd_idx_round(nc,p1,thd_arr); thd=thd_arr(idx); %%%%%%%%%%%%%%%%%
   [z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
   [cr,crc,r,lB,pr,nr]=k_criterion(z1);   [cri,crci,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
   %[cr cri],pr %%%%%%%%%%%%%
end

sumcr = cr + cri;  sumcrc = crc + crci;

%sumr=sum(r)
%thdddddddddddd=thd
