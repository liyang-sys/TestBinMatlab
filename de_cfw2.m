function [cfw,inv,ptr]=de_cfw2(bin,lenr,ptr)

inv=bin(ptr);  ptr=ptr+1;
bn=char(bin(ptr:ptr+3)+48); ptr=ptr+4;

switch bn
   case '0000'
      c=zeros(1,100*lenr); nc=1; n1s=0;
      while n1s<lenr
         if bin(ptr)>0
            c(nc)=1; n1s=n1s+1;
         end
         ptr=ptr+1; nc=nc+1;
      end
      c=c(1:nc-1);
      cfw=Golomb0(c);
   case '0001'
      if inv==0
         [c,ptr]=decode_block3_n1s(bin,lenr,ptr);
      else
         [c,ptr]=decode_block3_n0s(bin,lenr,ptr); 
      end
      cfw=Golomb0(c);
   case '0010'
      if inv==0
         [c,ptr]=decode_block5_n1s(bin,lenr,ptr);
      else
         [c,ptr]=decode_block5_n0s(bin,lenr,ptr);
      end
      cfw=Golomb0(c);
   otherwise
      codebook=bin2dec(bn)-3;
      if codebook==12
         flg=bin(ptr); ptr=ptr+1;
         if flg==0
            cfw=lenr;
         else
            [cfw,ptr]=decode_stationary_source_r_invr(bin,codebook,lenr,inv,ptr);
         end
      else
         [cfw,ptr]=decode_stationary_source_r_invr(bin,codebook,lenr,inv,ptr);
      end
end

if inv==1
   cfw=KW_inversion_runs(cfw);
end
