function [z,ptr]=de_z0_r0(bin,len,ptr)

[cbook,ptr] = deSFcode(bin,36,ptr);

if cbook==1
   z=bin(ptr:ptr+len-1); ptr=ptr+len;
elseif cbook==2
   [z,ptr]=decode_block3(bin,len,ptr);
elseif cbook==3
   [z,ptr]=decode_block5(bin,len,ptr);
else
   lastBit=bin(ptr); ptr=ptr+1;
   codebook=cbook-4;
   [runs,ptr]=decode_stationary_source_sumr(bin,codebook,len,ptr);
   z=GolombInv(runs,lastBit);
end

%inv=bin(ptr); ptr=ptr+1;
%if inv==1,  z=1-z;  end
