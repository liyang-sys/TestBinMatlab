function [r,ptr,sep,rk,rw]=de_runs_1sep(biny,lenr,cbook,ptr)

flg=biny(ptr); ptr=ptr+1;
if flg<0.5   %length(z)>600
   [thd,ptr]=decode_stationary_source_lenr(biny,cbook,1,ptr);

   %decoding sep --------------------------------------------------------
   lastBit=biny(ptr);  ptr=ptr+1;
   [codebook,ptr] = deSFcode(biny,5,ptr); codebook=codebook-1; 
   [rs,ptr]=decode_stationary_source_sumr(biny,codebook,lenr,ptr);
   sep=GolombInv(rs,lastBit);

   %decoding rw and rk --------------------------------------------------
   [rk,rw,ptr]=de_runs_sep_sub(biny,ptr,thd,sep);
   
   %synthesis r --------------------------------------------------------
   r=separate_inv(sep,rw+thd,rk);
else   %length(z)<600
   %codebook=bin2dec(char(biny(ptr:ptr+1)+48));  ptr=ptr+2;
   [codebook,ptr] = deSFcode(biny,5,ptr); codebook=codebook-1;;
   [r,ptr]=decode_stationary_source_lenr(biny,codebook,lenr,ptr);
end

