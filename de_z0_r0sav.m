function [z,ptr]=de_z0_r0(bin,len,ptr)

fg=char(bin(ptr:ptr+2)+48); ptr=ptr+3;

switch fg
   case '000'
      z=bin(ptr:ptr+len-1); ptr=ptr+len;
   case '001'
      [z,ptr]=decode_block3(bin,len,ptr);
   case '010'
      [z,ptr]=decode_block5(bin,len,ptr);
   case '011'
      lastBit=bin(ptr); ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_sumr(bin,0,len,ptr);
      z=GolombInv(runs,lastBit);
   case '100'
      lastBit=bin(ptr); ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_sumr(bin,1,len,ptr);
      z=GolombInv(runs,lastBit);
   case '101'
      lastBit=bin(ptr); ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_sumr(bin,2,len,ptr);
      z=GolombInv(runs,lastBit);
   case '110'
      lastBit=bin(ptr); ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_sumr(bin,3,len,ptr);
      z=GolombInv(runs,lastBit);
   otherwise
      lastBit=bin(ptr); ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_sumr(bin,4,len,ptr);
      z=GolombInv(runs,lastBit);
end

%inv=bin(ptr); ptr=ptr+1;
%if inv==1,  z=1-z;  end
