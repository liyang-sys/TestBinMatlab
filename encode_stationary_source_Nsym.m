function [bin,codebook] = encode_stationary_source_Nsym(r, p_or_codebook, Nsym)

if Nsym<=5

   %codebook=p_or_codebook;
   codebook=0;  %<================== modified 2014/12/4
   
   bin=uint8(zeros(1,20000));   ptr=1;
   for ia=1:length(r);
      bn = SFcode(r(ia),Nsym); lenb=length(bn);
      bin(ptr:ptr+lenb-1)=bn;   ptr=ptr+lenb;
   end
   bin=bin(1:ptr-1);
else
   [bin,codebook] = encode_stationary_source_Nsym_sub(r, p_or_codebook, Nsym);
end