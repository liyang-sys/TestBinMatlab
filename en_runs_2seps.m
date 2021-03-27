function [biny,sep]=en_runs_2seps(r,p,lenz,cbook,biny)

%if lenz > 1000
if lenz > 2000  %modified Dec 14, 2014
   biny=[biny 0];  %flag length(z)>1000
   %separating r into rk and rw ------------------
   n=hist(r,[1:max(r)]);
   thd=find_thd(n,p); %thdddd=thd%%%%%%%%%%%%%%%%%%%%%

   bin = encode_stationary_source(thd,4);  biny=[biny bin]; 
   [sep,rw,rk]=separate(r,thd);   rw=rw-thd;   nk=n(1:thd); 
   %encoding sep ----------------------------------
   [rs,lastBit]=Golomb0(sep);  biny=[biny lastBit];
   lenrs=length(rs);
   bin = encode_stationary_source(lenrs,cbook);  biny=[biny bin]; 

   cbk=4; biny=en_runs_1sep(rs,p,cbk,length(sep),biny);
   
   %encoding rk and rw ----------------------------
   %pppppppppppppp=length(rw)/sum(rw) %<=====0.34 code rw wrongly? 
   %nw=shist(rw); prob_est(nw)
   biny=en_runs_sep_sub(thd,rk,nk,rw,biny); 

else
   biny=[biny 1];  %flag length(z)<=1000
   cbk=4; biny=en_runs_1sep(r,p,cbk,lenz,biny);
end
