function [biny,xx]=en_sub3d_sub2(cf0,sn,maxcf0)

cf0=cf0+1; %<=== treat cf0 as runs!
maxcf=double(maxcf0+1);
nc=hist(double(cf0),[1:maxcf]); sm=length(cf0);


%fprintf('\n000000000000\n');


%first round ==========================================================================

thd_arr=[1 2 3 4 5 7 9 13 17 25 33 49 65 97 129 193];   p=0.5;
idx=find_thd_idx_round(nc,p,thd_arr); thd=thd_arr(idx) %%%%%%%%%%%%%%%%%

maxcr=0;
%pp=sum( nc(1:thd))/sm %%%%%%%%%%%%%%%
while maxcr<210 & sum( nc(1:thd))/sm<0.7
   %fprintf('\n000000000000\n');
   thd=thd_arr(idx);
   [z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
   [cr,k,r,lB,pr,nr]=k_criterion(z1);   [cri,ki,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
   [cr cri] %%%%%%%%%%%%%
   idx=idx+1; %%%%%%%%%%%%%
end
idx=idx-1;
thdd=thd %%%%%%%%%%%%%%%

if  abs(sum( nc(1:thd))/sm-0.7)<abs(sum( nc(1:thd+1))/sm-0.7)
   %thd=thd-1;
   [z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
   [cr,k,r,lB,pr,nr]=k_criterion(z1);   [cri,ki,ri,lBi]=k_criterion(1-z1);   maxcr=max([cr cri]);
end
thddd=thd %%%%%%%%%%%%%%%


%en_zone_1st --------------------------------------------
%sum(r) is known, which is the length of z1, but length(r) is not known. Code: length(rw) 

crrrrrr=cr, criiiiiiiiiiiii=cri,pr
%shist(r);
fprintf('\n------------------------------------------------------\n')
[binww,ssp]=en_zone_sub_new(r,cr,[]);
fprintf('\n------------------------------------------------------\n')
[binww1,ssp]=en_zone_sub_newsav(r,cr,[]);
fprintf('\n===------------------------------------------------------\n')


%if cr<60 & cri<10, there is no need to use en_zone_new (use en_zone_new_sub)
[bin,xx]=en_zone_new(r,lB,nr);
fprintf('\n===------------------------------------------------------\n')
[binsav,xx]=en_zone_new_sav(r,lB,nr);

fprintf('\n------------------------------------------------------\n')
[bin1,xx]=en_zone_new1(r,lB,nr);
%fprintf('\n------------------------------------------------------\n')
%[bin11,xx]=en_zone_new11(r,lB,nr);


[length(bin) length(binsav) length(binww) length(binww1) length(bin1)]
%length(bin)


%[rr,ptr]=de_zone_sub_new(binww,1);
[zr,rr,ptr,xxr] = de_zone_new(bin,1);
%[zr,rr,ptr,xxr] = de_zone_new_sav(binsav,1);


plot(double(rr)-double(r))
%plot(double(zr)-double(z1))
H(sum(z1)/length(z1))*length(z1)

xx=0;

%[r1,lB]=Golomb0(z1); lB=uint8(lB);  [bin1,sep]=en_zone_sub(r1,lB);  %<== encoding z1 


biny=0;