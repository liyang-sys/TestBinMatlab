function [biny,sep]=en_runs_1sep(r,p,cbook,lenz,biny)

if lenz > 600  &&  length(r)>=5
   biny=[biny 0];  %flag length(z)>600

   %separating r into rk and rw ------------------------------
   n=hist(r,[1:max(r)]);
   thd=find_thd(n,p); %thdddddddddddd=thd %%%%%%%%%%%%%%%%%%%%
   bin = encode_stationary_source(thd,cbook);  biny=[uint8(biny) bin];
   [sep,rw,rk]=separate(r,thd);   rw=rw-thd;   nk=n(1:thd); 
   
   %shist(sep), ls=length(sep)
   
   %encoding sep ---------------------------------------------
   [rs,lastBit,ps]=Golomb0(sep);  biny=[biny lastBit];
   [bin,codebook]=encode_stationary_source(rs,ps); %codebook
   
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         if codebook>4 %<====== 2021年4月28日更改
             codebook=4; [bin,codebook]=encode_stationary_source(rs,codebook);
         end     %<====== 2021年4月28日更改
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
   codebook=uint8(SFcode(codebook+1,5)); 
   biny=[biny codebook  bin];
   %encoding rk and rw ---------------------------------------
   biny=en_runs_sep_sub(thd,rk,nk,rw,biny);   
else
   biny=[biny 1];  %flag length(z)<600
   [bin,codebook]=encode_stationary_source(r,length(r)/sum(r)); %codebook
   %modified on 28/10/2017 ==========================================================
   if codebook>5, 
      codebook=5;
      fprintf('\n\n codebook modified in en_runs_1sep.m !!! \n\n');
      [bin,codebook]=encode_stationary_source(r,codebook); %<=== added to correct the bug 2017/11/10
   end
   codebook=uint8( SFcode(codebook+1,6) );
   %=================================================================================
   biny = [biny  codebook bin];
   sep=0;
end
      