function [bin,rw]=en_zone_new(r,lB,nc)

th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

p1=0.7; p2=0.8; Ln=length(nc);

%first sep: ==============================================================
idx=find_thd_idx(nc,p1,th); thd1=th(idx); %%%%%%%%%%%%%%%%%%%%%
bin_idx1=encode_stationary_source(idx, 3); 

[sep1,rw,rk1]=separate(r,thd1); rw=rw-thd1; nck=nc(1:thd1); ncw=nc(thd1+1:Ln); Ln=Ln-thd1;
11111
if thd1>1
   bink1=en_Kside_new(rk1,thd1,nck);
else
   bink1=[];
end

[crs,k,rs,lBs]=k_criterion(sep1); crs
if crs>60
   bins1=[lBs 1];
   [bins1]=en_zone_sub_new1(rs,crs,bins1);
else
   bins1=[lBs 0];
   cbook=17; [bins1]=en_runs_2sepsA(rs,p2,cbook,bins1);
end
bin1=[bin_idx1 bins1 bink1];


%Second sep: ============================================================
idx=find_thd_idx(nc,p1,th); thd2=th(idx); %%%%%%%%%%%%%%%%%%%%%
bin_idx2=encode_stationary_source(idx, 3); 

[sep2,rw2,rk2]=separate(rw,thd2); rw2=rw2-thd2;  nck=ncw(1:thd2); ncw=ncw(thd2+1:Ln); Ln=Ln-thd2;

if thd2>1
   bink2=en_Kside_new(rk2,thd2,nck);
else
   bink2=[];
end
22222
[crs,k,rs,lBs]=k_criterion(sep2); crs
if crs>60
   [bins2]=en_zone_sub_new1(rs,crs,lBs);
   bin2=[1 bins2 bin_idx2 bink2];

   crw2=k_criterion(rw2);
   [binw]=en_zone_sub_new1(rw2,crw2,[]);      
else
   %bins2=[lBs 0];
   %cbook=17; [bins2]=en_runs_2sepsA(rs,p2,cbook,bins2);
   
   bin2=[0];
   crw=k_criterion(rw);
   [binw]=en_zone_sub_new1(rw,crw,[]);      
end
length(binw)


%=======================================================================
bin=[bin1 bin2 binw lB];
