function [biny,sep,rk,rw]=en_r1(r,p,biny)

   %separating r into rk and rw ------------------------------
   n=hist(r,[1:max(r)]);
   thd=find_thd(n,p); %thdddddddddddd=thd %%%%%%%%%%%%%%%%%%%%

   %cbook=4; bin = encode_stationary_source(thd,cbook);  biny=[uint8(biny) bin]; %lent=length(bin)
   [idx,thd]=thd_index(thd); %modified Mar.28, 2015
   bin=SFcode(idx,40);   biny=[uint8(biny) bin];
   

   [sep,rw,rk]=separate(r,thd);   rw=rw-thd;   nk=n(1:thd); 
   %whos sep rw rk
   
   %encoding sep ---------------------------------------------
   [rs,lastBit,ps]=Golomb0(sep);  biny=[biny lastBit];
   bin_lenrs = encode_stationary_source(length(rs),20); 
   [bin,codebook]=encode_stationary_source(rs,ps);
   
   
   %modified (added) Oct 24, 2020 ========================================================================
   if codebook>4
      codebook=4;
      [bin,codebook]=encode_stationary_source(rs,codebook);
   end
   %modified (added) Oct 24, 2020 ========================================================================

   
   
   codebook=uint8(SFcode(codebook+1,5)); 
   biny=[biny bin_lenrs codebook  bin];
      
   %encoding rk and rw ---------------------------------------
   %maxkw=[max(rk), max(rw)] %%%%%%%%%%%%%%%%%%%%%%%%%
   biny=en_runs_sep_sub(thd,rk,nk,rw,biny);   
