function [rk,rw,ptr]=de_runs_sep_sub(biny,ptr,thd,sep)

lenw=sum(sep); lenk=length(sep)-lenw;

%[codebook,ptr] = deSFcode(biny,10,ptr); codebook=codebook-1 %modified Dec. 19, 2013
%[codebook,ptr] = deSFcode(biny,12,ptr); codebook=codebook-1; %modified Nov. 21, 2014
%[rw,ptr]=decode_stationary_source_lenr(biny,codebook,lenw,ptr);

[rw,inv,ptr]=de_r0(biny,lenw,ptr);

if thd>1
   if (thd<10  &&  lenk>500) ||  (thd<7  &&  lenk>300) ||  (thd<4  &&  lenk>150)
      [rk,ptr]=de_Kside(biny,thd,lenk,ptr);
   else
      flg=biny(ptr);  ptr=ptr+1;
      if flg<0.5
         %codebook=bin2dec(char(biny(ptr:ptr+1)+48));  ptr=ptr+2; 
         %codebook=bin2dec(char(biny(ptr:ptr+2)+48)),  ptr=ptr+3;  %modified Nov. 21, 2014
         [codebook,ptr] = deSFcode(biny,16,ptr); codebook=codebook-1;    %modified Mar. 30, 2015
         [rk,ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk,thd,ptr);
      else
         [c,ptr]=de_KsideSub_n1s(ptr,biny,lenk);
         rk=Golomb0(c);
      end
   end
else
   rk=ones(1,lenk);
end