function  [bin,codebook]=encode_stationary_source_r_invr(r,inv,lastRun, p_or_codebook)

if inv==0
   [bin,codebook]=encode_stationary_source(r, p_or_codebook);
else
   if lastRun==1
      [bin,codebook]=encode_stationary_source(r, p_or_codebook);
      bin=[bin 0];
   else
      [bin,codebook]=encode_stationary_source(r(1:length(r)-lastRun+1), p_or_codebook);
      c=[ones(1,lastRun-2) 0];
      bin=[bin 1 c];
   end
end
