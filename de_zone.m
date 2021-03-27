function [zr,ptr]=de_zone(biny,lenz,ptr)

lastBit=biny(ptr);  ptr=ptr+1;
[flg,ptr] = deSFcode(biny,7,ptr);

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
      %fprintf('\n33333333333333333333\n')
      Nsep=2; [zr,ptr]=de_zone_sub3(biny,lastBit,Nsep,ptr);
   case 4
      %fprintf('\n4444444444444444444444\n')
      Nsep=3; [zr,ptr]=de_zone_sub3(biny,lastBit,Nsep,ptr);
   case 5
      %fprintf('\n55555555555555555555555555\n')
      Nsep=4; [zr,ptr]=de_zone_sub3(biny,lastBit,Nsep,ptr);
   case 6
      %fprintf('\n6666666666666666666666\n')
      [zr,ptr]=de_zone_sub2(biny,lastBit,ptr);
   case 7
      %fprintf('\n7777777777777777777777777\n')
      [zr,ptr]=de_zone_sub(biny,lastBit,ptr);
end
