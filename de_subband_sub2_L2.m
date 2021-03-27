function [cf0,sn,ptr,z1]=de_subband_sub2_L2(biny,lenz,ptr)

flg=char(biny(ptr:ptr+1)+48); ptr=ptr+2;

[z,ptr]=de_zone(biny,lenz,ptr);
lenz1=sum(z);
sn0=biny(ptr:ptr+lenz1-1); ptr=ptr+lenz1;
sn=sign(double(sn0)-0.5);

switch flg
   case '00'
      cf1=ones(1,length(sn));
   case '01'
      [z1,ptr]=de_zon(biny,lenz1,ptr);
      cf1=z1+1;
   case '10'
  %   [z1,ptr]=de_zone(biny,lenz1,ptr);
      [z1,ptr]=de_zon(biny,lenz1,ptr);

      [cf2,inv,ptr]=de_cfw(biny,sum(z1),ptr);
      cf1=separate_inv(z1,cf2+1,ones(1,length(z1)-length(cf2)));
   case '11'
  %   [z1,ptr]=de_zone(biny,lenz1,ptr);
      [z1,ptr]=de_zon(biny,lenz1,ptr);

      ck2=ones(1,lenz1-sum(z1)); 
      %---------------------------------------------------------------
      [lenrs,ptr]=decode_stationary_source_lenr(biny,17,1,ptr);

      lastBit=biny(ptr); ptr=ptr+1;
      [rz2,ptr]=de_runs_1sep(biny,lenrs,4,ptr);
      z2=GolombInv(rz2,lastBit);
      [thd2,ptr]=decode_stationary_source_lenr(biny,2,1,ptr); 

      lencf3=sum(z2); lencf2=length(z2);

      if thd2>1
      [ck3,ptr]=de_Kside(biny,thd2,lencf2-lencf3,ptr);
      else
         ck3=ones(1,lencf2-lencf3);
      end

      %---------------------------------------------------------------
      [cf3,inv,ptr]=de_cfw(biny,lencf3,ptr); 

      cf2=separate_inv(z2,cf3+thd2,ck3);

      cf1=separate_inv(z1,cf2+1,ck2);
end

cf0=separate_inv(z,cf1,zeros(1,lenz-lenz1));
