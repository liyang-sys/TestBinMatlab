function [z2,cf2k,ptr,thd2,z2k]=de_sub3d_sub2_sub(biny,thd2,ptr,cs,len)

incthd=biny(ptr); ptr=ptr+1;
if incthd>0, thd2=thd2*2; end

if cs==1
   %lB=biny(ptr); ptr=ptr+1; [z2,ptr]=de_zone_sub(biny,lB,ptr);
   [z2,ptr]=de_zone(biny,len,ptr); 
elseif cs==2
   lB=biny(ptr); ptr=ptr+1; [z2,ptr]=de_zone_sub2(biny,lB,ptr);
else
   [z2,ptr]=de_z1(biny,ptr);
end

len2=length(z2); lenw2=sum(z2); lenk2=len2-lenw2;

flg=biny(ptr); ptr=ptr+1;
if flg==0
   if cs==1
      %lB=biny(ptr); ptr=ptr+1;   [z2k,ptr]=de_zone_sub2(biny,lB,ptr);
      [z2k,ptr]=de_zone(biny,lenk2,ptr);
   else
      [z2k,ptr]=de_z1(biny,ptr);
   end
else
   [z2k,ptr]=de_z0(biny,lenk2,ptr);
end
lenk2w=sum(z2k); lenk2k=lenk2-lenk2w;
if thd2>=4
   [cf2kw,ptr,z]=de_2n_code(biny,lenk2w,thd2/4,ptr);
   [cf2kk,ptr,z]=de_2n_code(biny,lenk2k,thd2/4,ptr);
   cf2k=separate_inv(z2k,cf2kw+thd2/2,cf2kk);
else
   cf2k=z2k+1;
end
