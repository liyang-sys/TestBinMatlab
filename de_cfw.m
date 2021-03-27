function [cfw,inv,ptr]=de_cfw(bin,lenr,ptr)

inv=bin(ptr);  ptr=ptr+1;
bn=char(bin(ptr:ptr+1)+48); ptr=ptr+2;

switch bn
   case '00'
      c=zeros(1,100*lenr); nc=1; n1s=0;
      while n1s<lenr
         if bin(ptr)>0
            c(nc)=1; n1s=n1s+1;
         end
         ptr=ptr+1; nc=nc+1;
      end
      c=c(1:nc-1);
      cfw=Golomb0(c);
   case '01'
      if inv==0
         [c,ptr]=decode_block3_n1s(bin,lenr,ptr);
      else
         [c,ptr]=decode_block3_n0s(bin,lenr,ptr); 
      end
      cfw=Golomb0(c);
   case '10'
      bt=bin(ptr); ptr=ptr+1;
      if bt==0
         if inv==0
            [c,ptr]=decode_block5_n1s(bin,lenr,ptr);
         else
            [c,ptr]=decode_block5_n0s(bin,lenr,ptr);
         end
         cfw=Golomb0(c);
      else
         [cfw,ptr]=decode_stationary_source_r_invr(bin,0,lenr,inv,ptr);
      end
   case '11'
      bt=bin(ptr); ptr=ptr+1;
      if bt==0
         [cfw,ptr]=decode_stationary_source_r_invr(bin,1,lenr,inv,ptr);
      else
         bt=bin(ptr); ptr=ptr+1;
         if bt==0
            [cfw,ptr]=decode_stationary_source_r_invr(bin,2,lenr,inv,ptr);
         else
            [cfw,ptr]=decode_stationary_source_r_invr(bin,3,lenr,inv,ptr);
         end
      end
end

if inv==1
   cfw=KW_inversion_runs(cfw);
end
