function [biny,z,z2]=en_subband_sub1_L2(cf0,z,sn,maxcf0)

[z10,cf2,cf1k]=separate(cf0,1);   cf2=cf2-1;

inv=0;  %modified %Dec.30, 2013
if (sum(z10)/length(z10))>0.5  %modified %Dec.30, 2013
   z10=1-z10; inv=1;  %modified %Dec.30, 2013
end  %modified %Dec.30, 2013
biny0=[inv en_zone(z10)];  %modified %Dec.30, 2013

inv1=0; %modified  Mar.13, 2014
if (sum(cf1k)/length(cf1k))>0.5   %modified Mar.13, 2014
   cf1k=1-cf1k; inv1=1;  %modified  Mar.13, 2014
end  %modified  Mar.13, 2014
biny1=[inv1 en_zone(cf1k)]; %modified  Mar.13, 2014


%further separations: =================================================================
lenc2=max(cf2); nc2=hist(double(cf2),[1:double(lenc2)]);
thd2=2;   [z2,cf3,ck3]=separate(cf2,thd2);   cf3=cf3-thd2;
nck3=nc2(1:thd2);   nc3=nc2(thd2+1:lenc2);

if maxcf0<25  %<======== Here is the difference from L1 (no difference for decoding)!!! 
%if maxcf0<32
   bin_z2=en_z1(z2);

   if maxcf0<19
      bin=en_Kside(ck3,thd2,nck3);
      biny2 = [bin_z2 0 bin];
   else
      bin=en_z1(double(ck3)-1);
      biny2 = [bin_z2 1 bin];
   end
   
   %encode cf3: =============================================================
   binw3=en_cfw(cf3);   
      
   biny=[biny0 biny1 sn 0 biny2 binw3];
else
   %length(z2),sum(z2) %%%%%%%%%%%%%%%%%
   inv2=0; %modified  Mar.13, 2014
   if (sum(z2)/length(z2))>0.5   %modified Mar.13, 2014
      z2=1-z2; inv2=1;    %modified Mar.13, 2014
   end   %modified Mar.13, 2014
   bin_z2=[inv2 en_zone(z2)];    %modified Mar.13, 2014
    
   bin=en_z1(double(ck3)-1);
   biny2=[bin_z2 bin];
   
   %one more separation: ==============================================================
   thd3=find_thd(nc3,0.7);
   [z3,cf4,ck4]=separate(cf3,thd3);   cf4=cf4-thd3;   nck4=nc3(1:thd3);
   bin_thd3=encode_stationary_source(thd3, 3); 
   bin_z3=en_z1(z3);

   if thd3>1
      bin=en_Kside(ck4,thd3,nck4); 
      biny3 = [bin_thd3 bin_z3 bin];
   else
      biny3 = [bin_thd3 bin_z3];
   end
   
   %encode cf4: ==============================================================
   binw4=en_cfw(cf4);
   
   biny=[biny0 biny1 sn 1 biny2 biny3 binw4];       
   %length(biny0)+length(biny1)+length(sn)+1+length(biny2)+length(biny3)
end
