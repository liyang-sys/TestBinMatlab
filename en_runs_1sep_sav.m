function [biny,sep]=en_runs_1sep(r,p,cbook,lenz,biny)

if lenz > 600
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
   codebook=uint8(SFcode(codebook+1,5)); 
   biny=[biny codebook  bin];
      
   %encoding rk and rw ---------------------------------------
   biny=en_runs_sep_sub(thd,rk,nk,rw,biny);   
else
   biny=[biny 1];  %flag length(z)<600
   [bin,codebook]=encode_stationary_source(r,length(r)/sum(r)); 
   %codebook=uint8( abs(dec2bin(codebook,2)) -48 );
   codebook=uint8( SFcode(codebook+1,5) );
   biny = [biny  codebook bin];
   sep=0;
end
      