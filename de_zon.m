function [zr,ptr]=de_zon(biny,lenz,ptr)

lastBit=biny(ptr);  ptr=ptr+1;
[flg,ptr] = deSFcode(biny,4,ptr);

switch flg
   case 1
      %fprintf('\n11111111111111111111111\n')
      codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
      [r,ptr]=decode_stationary_source_sumr(biny,codebook,lenz,ptr);
      zr=GolombInv(r,lastBit);
   case 2
      %fprintf('\n2222222222222222222222222\n')
      Nsep=1; [zr,ptr]=de_zone_sub3(biny,lastBit,Nsep,ptr);
   case 3
      %fprintf('\n3333333333333333333333\n')
      [zr,ptr]=de_zone_sub2(biny,lastBit,ptr);
   case 4
      %fprintf('\n44444444444444444444444444\n')
      [zr,ptr]=de_zone_sub(biny,lastBit,ptr);
end
