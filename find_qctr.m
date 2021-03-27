function [qctr,binq,ptr]=find_qctr(bin,ptr)

whos bn
ptr0=ptr;
qnt=bin(ptr); ptr=ptr+1;
if qnt>0
   trim=bin(ptr); ptr=ptr+1;
   if trim==1
      qctr=1;
      %[mag,ptr] = deSFcode(bin,27,ptr); mag=mag-1;
      %[mag,ptr] = deSFcode(bin,32,ptr); mag=mag-1;
   else
      qctr=bin(ptr); ptr=ptr+1;
      if qctr==0
         [ctr1,ptr] = deSFcode(bin,64,ptr);
      end
   end
   binq=bin(ptr0:ptr-1);
else
   qctr=1; binq=0;
end
