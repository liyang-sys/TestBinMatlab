function [bin,sep1,xxx]=en_zone_new(r,lB,nc)
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];
p1=0.7; p2=0.8; Ln=length(nc);

%first sep: ==============================================================
idx=find_thd_idx(nc,p1,th); thd1=th(idx); %%%%%%%%%%%%%%%%%%%%%
bin_idx1=encode_stationary_source(idx, 3); 

[sep1,rw,rk1]=separate(r,thd1); rw=rw-thd1; nck=nc(1:thd1); ncw=nc(thd1+1:Ln); Ln=Ln-thd1;

[crs,k,rs,lBs,ps,nr]=k_criterion(sep1); %crsaaaaa=crs
if crs>60
   bins1=[lBs 1];
   [bins1]=en_zone_sub_new(rs,crs,bins1);
else
   bins1=[lBs 0];
   cbook=17; bins1=en_runs_2sepsA(rs,p2,cbook,bins1);
   %[rsr,ptr]=de_runs_2sepsA(bins1,cbook,3);
   %whos rsr rs
   %plot(rsr-rs)
end

if thd1>1
   prob=probility_estimation(rk1,nck);% thd1
   if ((prob>0.15) & (thd1<=16))  %<==== modified Dec 14, 2014
      bink1=[0 en_Kside_new(rk1,thd1,nck)];
   else
      [bintem,codebook]=encode_stationary_source_Nsym(rk1,prob,thd1); %codebook %%%%%%%%%%%%
      codebook=uint8( abs(dec2bin(codebook,4)) -48 );
      bink1 = [1 codebook bintem];
   end
else
   bink1=[];
end

bin1=[bin_idx1 bins1 bink1];
%lennew=[length(bins1) length(bink1)] %%%%%%%%%%%%%%%%


%Second sep: ============================================================





%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%???????????????????????????????????????????????????????????????????????????????????????????
%idx=find_thd_idx(nc,p1,th); thd2=th(idx); %fatal mistake!!!!!!!!!!!
idx=find_thd_idx(ncw,p1,th); thd2=th(idx); %%%%%%%%%%%%%%%%%%%%%
%???????????????????????????????????????????????????????????????????????????????????????????
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





[sep2,rw2,rk2]=separate(rw,thd2); rw2=rw2-thd2;  nck=ncw(1:thd2); ncw=ncw(thd2+1:Ln); Ln=Ln-thd2;
[crs,k,rs,lBs]=k_criterion(sep2); %crsbbb=crs %%%%%%%%%%%%%%%%%

if crs>50
   bin_idx2=encode_stationary_source(idx, 3);
   [bins2]=en_zone_sub_new(rs,crs,lBs);

   if thd2>1
      prob=probility_estimation(rk2,nck);% thd2
      if ((prob>0.15) & (thd2<=16))  %<==== modified Dec 14, 2014
         bink2=[0 en_Kside_new(rk2,thd2,nck)];
      else
         [bintem,codebook]=encode_stationary_source_Nsym(rk2,prob,thd2); %codebook %%%%%%%%%%%%
         codebook=uint8( abs(dec2bin(codebook,4)) -48 );
         bink2 = [1 codebook bintem];
      end
   else
      bink2=[];
   end
   
   bin2=[1 bin_idx2 bins2 bink2];

   %----------------------------------------------------
   crw2=k_criterion(rw2);
   [binw]=en_zone_sub_new(rw2,crw2,[]);      
else
   %shist(rw),   sum(rw)
   bin2=[0];
   crw=k_criterion(rw);
   [binw]=en_zone_sub_new(rw,crw,[]); 
   
   %[rwr,ptr]=de_zone_sub_new(binw,1); 
   %plot(rwr-rw)
end

%lennew=[length(bin1) length(bin2) length(binw)] %%%%%%%%%%%%%%%%%%%%%
%=======================================================================
bin=[lB bin1 bin2 binw];
xxx=0;
