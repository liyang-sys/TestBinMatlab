function [z,ptr]=de_r_cr(bin,len,ptr)

flg=2*bin(ptr)+bin(ptr+1); ptr=ptr+2;
if flg==3
   [z,r,ptr]=de_zone_new(bin,ptr);
elseif flg==2
   lB=bin(ptr); ptr=ptr+1;
   [z,ptr]=de_zone_sub2(bin,lB,ptr);
elseif flg==1
   lB=bin(ptr); ptr=ptr+1;
   [r,ptr]=de_r1(bin,ptr);
   z=GolombInv(r,lB);
else
   [z,ptr]=de_z0_r0(bin,len,ptr);
end
