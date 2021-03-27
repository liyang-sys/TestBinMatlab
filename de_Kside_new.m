function [rk,ptr]=de_Kside_new(bin,thd,lenr,ptr)

%Only minor modification from de_Kside.m in option 'otherwise'

switch thd
   case 2
      flg=bin(ptr);   ptr=ptr+1;
      if flg < 0.5
         [c,ptr]=de_KsideSub(ptr,bin,lenr);
         rk=c+1;
      else
         %codebook = bin2dec( char(bin(ptr:ptr+1)+48) ) +1;   ptr=ptr+2;
         codebook = bin2dec( char(bin(ptr:ptr+2)+48) ) +1;   ptr=ptr+3;  %modified 17/04/15
         lastBit=bin(ptr);  ptr=ptr+1;
         [runs,ptr]=decode_stationary_source_sumr(bin,codebook,lenr,ptr);
         rk=GolombInv(runs,lastBit)+1;
      end
   case 3
      %fprintf('\n3333333333333333333\n')
      [sep,ptr]=de_KsideSub(ptr,bin,lenr);
      [c,ptr]=de_KsideSub(ptr,bin,sum(sep));
      rA=c+1;
      rk=separate_inv(sep,rA+1,ones(1,lenr-sum(sep)));
   case 4
      %fprintf('\n4444444444444444444\n')
      [sep,ptr]=de_KsideSub(ptr,bin,lenr);
      [sep1,ptr]=de_KsideSub(ptr,bin,sum(sep));
      [c,ptr]=de_KsideSub(ptr,bin,sum(sep1));

      rA1=c+1;
      rA=separate_inv(sep1,rA1+1,ones(1,length(sep1)-sum(sep1)));
      rk=separate_inv(sep,rA+1,ones(1,lenr-sum(sep)));
   case 5
      %fprintf('\n555555555555555555\n')
      [sep,ptr]=de_KsideSub(ptr,bin,lenr);
      [sep1,ptr]=de_KsideSub(ptr,bin,sum(sep));
      [sep2,ptr]=de_KsideSub(ptr,bin,sum(sep1));
      [c,ptr]=de_KsideSub(ptr,bin,sum(sep2));

      rA2=c+1;
      rA1=separate_inv(sep2,rA2+1,ones(1,length(sep2)-sum(sep2)));
      rA=separate_inv(sep1,rA1+1,ones(1,length(sep1)-sum(sep1)));
      rk=separate_inv(sep,rA+1,ones(1,lenr-sum(sep)));
   case 6
      %fprintf('\n666666666666666\n')
      [sep,ptr]=de_KsideSub(ptr,bin,lenr);
      [c,ptr]=de_KsideSub(ptr,bin,length(sep)-sum(sep));  rB=c+1;

      [sep1,ptr]=de_KsideSub(ptr,bin,sum(sep));
      [sep2,ptr]=de_KsideSub(ptr,bin,sum(sep1));
      [c,ptr]=de_KsideSub(ptr,bin,sum(sep2));  rA2=c+1;

      rA1=separate_inv(sep2,rA2+1,ones(1,length(sep2)-sum(sep2)));
      rA=separate_inv(sep1,rA1+1,ones(1,length(sep1)-sum(sep1)));
      
      rk=separate_inv(sep,rA+2,rB);
   otherwise
      [sep,ptr]=de_KsideSub(ptr,bin,lenr);
      [c,ptr]=de_KsideSub(ptr,bin,length(sep)-sum(sep)); 
      lenrA=sum(c);  rB=c+1;
      
      %Here is the change from de_Kside.m --------------------------------------------
      %codebook=bin2dec(char(bin(ptr:ptr+3)+48));  ptr=ptr+4;
      [codebook,ptr]=decode_stationary_source_lenr(bin,4,1,ptr); codebook=codebook-1;
      %-------------------------------------------------------------------------------
      
      [rA,ptr]=decode_stationary_source_Nsym_lenr(bin,codebook,sum(sep),thd-2,ptr);     
      rk=separate_inv(sep,rA+2,rB);      
end
