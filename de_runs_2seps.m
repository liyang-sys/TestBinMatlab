function [r,ptr,sep]=de_runs_2seps(biny,lenr,cbook,ptr)

flg=biny(ptr); ptr=ptr+1;
if flg<0.5   %length(z)>1000
   [thd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr);

   %decoding sep --------------------------------------------------------
   lastBit=biny(ptr);  ptr=ptr+1;
   [lenrs,ptr]=decode_stationary_source_lenr(biny,cbook,1,ptr);
   cbk=4; [rs,ptr]=de_runs_1sep(biny,lenrs,cbk,ptr); 
   sep=GolombInv(rs,lastBit);

   %decoding rw and rk --------------------------------------------------
   [rk,rw,ptr]=de_runs_sep_sub(biny,ptr,thd,sep);
   
   %synthesis r --------------------------------------------------------
   r=separate_inv(sep,rw+thd,rk);
else   %length(z)<=1000
   cbk=4; [r,ptr]=de_runs_1sep(biny,lenr,cbk,ptr); 
end

