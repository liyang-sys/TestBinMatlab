function [biny,z,cf0,cf1,sn]=en_sub3d_sub1(cf0,z,sn,maxcf0,cf1)

%[cf0,z,sn,cf1]=coef_sign(subband);
%maxcf0=max(cf0);
%max_mean=[double(maxcf0) mean(double(cf1))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%separate 0: ================================================================================
biny0=en_zone(z);

if maxcf0==1
   biny=[0 0 biny0 sn];   %case 1 <==== !!!!!!!!!!!!!!!!!!!!!
else
   %separate 1: =============================================================================
   
   %p not garanteed >0.7 ???????
   
   [z1,cf2]=separate(cf1,1);   cf2=cf2-1;
   
   
   if sum(z1)/length(z1)>0.3, fprintf('\n inefficiency might occur en_sub3d_sub1: p=%f\n',sum(z1)/length(z1)); end
   
      
      %lenz1=length(z1), sum(z1), shist(z1)
   biny1=en_zone(z1);

   if maxcf0==2
   biny=[0 1 biny0 sn biny1];   %case 2 <==== !!!!!!!!!!!!!!!!!!!!!

   %elseif maxcf0<=6 
   elseif (maxcf0<=6) & (length(cf2)<100) %<=== Modification here!
      %encode 2 and above: ==================================================================
      binw2=en_cfw(cf2);
      %[cf2r,inv,ptrtem]=de_cfw(binw2,length(cf2),1);
      %plot(double(cf2r)-double(cf2))
      
      biny=[1 0 biny0 sn biny1 binw2];    %case 3 <==== !!!!!!!!!!!!!!!!!!!!!
   else %maxcf0>=7
      %one more separation: =================================================================
      lenc2=max(cf2); nc2=hist(double(cf2),[1:double(lenc2)]);
      thd2=find_thd(nc2,0.7);
      [z2,cf3,ck3]=separate(cf2,thd2);   cf3=cf3-thd2;
      nck3=nc2(1:thd2);

      [rz2,lastBit]=Golomb0(z2); 

      lenrs=length(rz2);
      bin_lenr = encode_stationary_source(lenrs,17);
      bin_z2=en_runs_1sep(rz2,0.8125,4,length(z2),lastBit);

      bin_thd2=encode_stationary_source(thd2, 2); 

      if thd2>1
         bin=en_Kside(ck3,thd2,nck3); 
         biny2 = [bin_lenr bin_z2 bin_thd2 bin];
      else
         biny2 = [bin_lenr bin_z2 bin_thd2];
      end

      %encode 3 and above: =====================================================================
      binw3=en_cfw(cf3);
      
      biny=[1 1 biny0 sn biny1 biny2 binw3];    %case 4 <==== !!!!!!!!!!!!!!!!!!!!!
      %len=length([1 1 biny0 sn biny1 biny2]) %%%%%%%%%%%%%%%%%%
   end
end
