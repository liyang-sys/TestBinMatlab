function [r,inv,ptr]=de_r0(bin,lenr,ptr)

inv=bin(ptr);  ptr=ptr+1;
[cbook,ptr] = deSFcode(bin,37,ptr);
%bnn1=bin(1:7)
%bnn2=bin(8:17)


if cbook==1
   c=zeros(1,100*lenr); nc=1; n1s=0;
   while n1s<lenr
      if bin(ptr)>0
         c(nc)=1; n1s=n1s+1;
      end
      ptr=ptr+1; nc=nc+1;
   end
   c=c(1:nc-1);
   r=Golomb0(c);
elseif cbook==2
   if inv==0
      [c,ptr]=decode_block3_n1s(bin,lenr,ptr);
   else
      [c,ptr]=decode_block3_n0s(bin,lenr,ptr); 
   end
   r=Golomb0(c);
elseif cbook==3
   if inv==0
      [c,ptr]=decode_block5_n1s(bin,lenr,ptr);
   else
      [c,ptr]=decode_block5_n0s(bin,lenr,ptr);
      
   end
   r=Golomb0(c);
else
   if cbook==37  &&  inv==1
      r=lenr;
   else
      codebook=cbook-4;
      [r,ptr]=decode_stationary_source_r_invr(bin,codebook,lenr,inv,ptr);
   end
end

if inv==1
   r=KW_inversion_runs(r);
end
