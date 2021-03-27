function [c,ptr]=de_KsideSub_n1s(ptr,bin,n1s0)


bn=char(bin(ptr:ptr+1)+48); ptr=ptr+2;

switch bn
   case '00'
      c=zeros(1,100*n1s0); nc=1; n1s=0;
      while n1s<n1s0
         if bin(ptr)>0
            c(nc)=1; n1s=n1s+1;
         end
         ptr=ptr+1; nc=nc+1;
      end
      c=c(1:nc-1); 
   case '01'
      [c,ptr]=decode_block3_n1s(bin,n1s0,ptr);
   case '10'
      [c,ptr]=decode_block5_n1s(bin,n1s0,ptr);
   case '11'
      lastBit=bin(ptr);  ptr=ptr+1;
      [runs,ptr]=decode_stationary_source_lenr(bin,0,n1s0,ptr);
      c=GolombInv(runs,lastBit);
end
