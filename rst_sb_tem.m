function [cfr,ptr]=rst_sub(bin,qcf,delta,ptr)
%This code is to test the effect from the triming operation!

if bin(ptr)==1
   ptr=ptr+1;
   if bin(ptr)==1  %trim
      ptr=ptr+1;
      delt=delta; T=0.8*delt;
      nc=hist(abs(qcf)+1,[1:max(abs(qcf))+1]);
      cfr=rstTHDctr(qcf,T,delt,nc);
   else %no trim
      ptr=ptr+1;
      if bin(ptr)==1  %quant center
         ptr=ptr+1;
         nc=hist(abs(qcf)+1,[1:max(abs(qcf))+1]);
         cfr=rstTHDctr(qcf,0.52*delta,delta,nc);
      else %quant even
         ptr=ptr+1;
         [ctr1,ptr] = deSFcode(bin,64,ptr);
         nc=hist(abs(qcf),[1:max(abs(qcf))]);
         cfr=rstEVENctr(qcf,delta,nc,ctr1-1);
         %cfr=rstEVEN(qcf,delta);
      end
   end
else
   ptr=ptr+1;
   cfr=zeros(size(qcf));
end
