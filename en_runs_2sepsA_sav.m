function [biny,sep]=en_runs_2sepsA(r,p,cbook,biny)

%Difference from en_runs_2seps.m: does not consider length (assuming long
%enough situation). Since 1 sep is excluded, length is coded and thus
%length is not required in decoding.





%biny0=biny;
%if lenz > 1000
 %  biny=[biny 0];  %flag length(z)>1000
 
 
 
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
   biny=en_runs_sep_sub(thd,rk,nk,rw,biny); 

   
   
%else
 %  biny=[biny 1];  %flag length(z)<=1000c
  % cbk=4; biny=en_runs_1sep(r,p,cbk,lenz,biny);
%end

%L2=length(biny)-length(biny0)%%%%%%%%%%%%%%%%%%%%%%%%%%%
