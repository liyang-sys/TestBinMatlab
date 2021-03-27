function [r,ptr,sep,rk,rw]=de_r1(biny,ptr)

   %[thd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr); 
   [idx,ptr] = deSFcode(biny,40,ptr);  %modified Mar.28, 2015
   thd=thd_index_inv(idx);
      
   %decoding sep --------------------------------------------------------
   lastBit=biny(ptr);  ptr=ptr+1;
   
   [lenrs,ptr]=decode_stationary_source_lenr(biny,20,1,ptr);

   [codebook,ptr] = deSFcode(biny,5,ptr); codebook=codebook-1;
   [rs,ptr]=decode_stationary_source_lenr(biny,codebook,lenrs,ptr);
   sep=GolombInv(rs,lastBit);
   
   %decoding rw and rk --------------------------------------------------
   [rk,rw,ptr]=de_runs_sep_sub(biny,ptr,thd,sep);
   %maxkw=[max(rk), max(rw)] %%%%%%%%%%%%%%%%%%%%%%%%%
   
   %synthesis r --------------------------------------------------------
   r=separate_inv(sep,rw+thd,rk);
