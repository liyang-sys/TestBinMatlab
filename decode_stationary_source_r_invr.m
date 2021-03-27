function  [r,ptr]=decode_stationary_source_r_invr(bin,cbk,lenr,inv,ptr)

if inv==0
   [r,ptr]=decode_stationary_source_lenr(bin,cbk,lenr,ptr);
else
   [r,ptr]=decode_stationary_source_leninvr(bin,cbk,lenr,ptr);
end
