function [c,ptr]=de_KsideSub(ptr,bin,len)

bn=char(bin(ptr:ptr+1)+48); ptr=ptr+2;

switch bn
   case '00'
      c=bin(ptr:ptr+len-1); ptr=ptr+len;
   case '01'
      [c,ptr]=decode_block3(bin,len,ptr);
   case '10'
      [c,ptr]=decode_block5(bin,len,ptr);
   case '11'
      bn=char(bin(ptr)+48); ptr=ptr+1;
      if bn=='0'
         lastBit=bin(ptr);  ptr=ptr+1;
         [runs,ptr]=decode_stationary_source_sumr(bin,0,len,ptr);
         c=GolombInv(runs,lastBit);
      else
         bn=char(bin(ptr)+48); ptr=ptr+1;
         if bn=='0'
            lastBit=bin(ptr);  ptr=ptr+1;
            [runs,ptr]=decode_stationary_source_sumr(bin,1,len,ptr);
            c=GolombInv(runs,lastBit);
         else
            bn=char(bin(ptr)+48); ptr=ptr+1;
            if bn=='0'
               lastBit=bin(ptr);  ptr=ptr+1;
               [runs,ptr]=decode_stationary_source_sumr(bin,2,len,ptr);
               c=GolombInv(runs,lastBit);
            else
               lastBit=bin(ptr);  ptr=ptr+1;
               [runs,ptr]=decode_stationary_source_sumr(bin,3,len,ptr);
               c=GolombInv(runs,lastBit);
            end
         end
      end
end

inv=bin(ptr); ptr=ptr+1;
if inv==1,  c=1-c;  end
