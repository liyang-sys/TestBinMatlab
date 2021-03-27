function [cf0,sn,ptr]=de_subband_sub1(biny,lenz,ptr)

[z10,ptr]=de_zone(biny,lenz,ptr);
[cf1k,ptr]=de_zone(biny,lenz-sum(z10),ptr);

lenz1=sum(z10)+sum(cf1k);
sn=biny(ptr:ptr+lenz1-1); ptr=ptr+lenz1;
sn=sign(double(sn)-0.5);


flg=biny(ptr); ptr=ptr+1;
if flg==0 
   [z2,ptr]=de_z1(biny,ptr);
%lenz2=length(z2)   %%%%%%%%%%%%%%%%%%%%%%%%
   lencf3=sum(z2);
   flg1=biny(ptr); ptr=ptr+1;
   if flg1==0
      [ck3,ptr]=de_Kside(biny,2,length(z2)-lencf3,ptr);
   else
      [ck3,ptr]=de_z1(biny,ptr); ck3=ck3+1; %ptr %%%%%%%%%%%%%%%%%
   end
   [cf3,inv,ptr]=de_cfw(biny,lencf3,ptr);
   cf2=separate_inv(z2,cf3+2,ck3);
%   sum(z10), length(cf2), length(cf1k), length(z10) %%%%%%%%%%%%%%%%%%%%%%%%%%
   cf0=separate_inv(z10,cf2+1,cf1k);
else 
   [z2,ptr]=de_zone(biny,sum(z10),ptr);
   lencf3=sum(z2); %%%%%%%%%%%%%%%%%
%   lenz2=length(z2) 
   [ck3,ptr]=de_z1(biny,ptr); ck3=ck3+1; %ptr %%%%%%%%%%%%%%%%%
   
   %=====================================================================
   [thd3,ptr]=decode_stationary_source_lenr(biny,3,1,ptr);
   [z3,ptr]=de_z1(biny,ptr); %thd3, ptr %%%%%%%%%%%%%%%%%
   lencf4=sum(z3); 
   
   if thd3>1
      [ck4,ptr]=de_Kside(biny,thd3,length(z3)-lencf4,ptr);
   else
      ck4=ones(1,length(z3)-lencf4);
   end
   
   [cf4,inv,ptr]=de_cfw(biny,lencf4,ptr);  %ptr %%%%%%%%%%%%%%%%%
   
   %--------------------------------------------------------------------
   cf3=separate_inv(z3,cf4+thd3,ck4);
   cf2=separate_inv(z2,cf3+2,ck3);
   cf0=separate_inv(z10,cf2+1,cf1k);
end

