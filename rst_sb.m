function [cfr,ptr]=rst_sub(bin,qcf,delta,ptr)

%dd=1/128;
%de=1^(1/32); dd=log(de);
if bin(ptr)==1
   ptr=ptr+1;
   if bin(ptr)==1  %trim
      %11111 %%%%%%%%%%%%%%%%%%%%%
      ptr=ptr+1;
      %[mag,ptr] = deSFcode(bin,32,ptr); mag=mag-1; %%%%%%%%%%%
      %delt=delta*(1+dd*mag); T=0.55*delt;
      delt=delta; T=0.55*delt;
      nc=hist(abs(qcf)+1,[1:max(abs(qcf))+1]);
      cfr=rstTHDctr(qcf,T,delt,nc);
      %cfr=rstTHDctr1(qcf,T,delt,0.28*delt,0.22*delt);
      %cfr=rstTHDctr1(qcf,T,delt,0.5*delt,0.5*delt);
   else %no trim
      ptr=ptr+1;
      if bin(ptr)==1  %quant center
         %22222 %%%%%%%%%%%%%%%%%
         ptr=ptr+1;
         nc=hist(abs(qcf)+1,[1:max(abs(qcf))+1]);
         cfr=rstTHDctr(qcf,0.52*delta,delta,nc);
      else %quant even
         %33333 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
