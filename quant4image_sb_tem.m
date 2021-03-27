function [qcf,bin,qctr]=quant4image_sub(sb,delta0)
%This code is to test the effect from the triming operation!

cf=quantEVEN(sb,delta0/10); abscf=abs(cf); 
lennc=max(abscf);  %note: the mininum of abscf is 1 here, not 0.
nc=hist(abscf,[1:lennc]); 

abssb=abs(sb);

if lennc>=6
   qnt=1;
  
   if lennc/10<120
   
      non=sum(nc(6:lennc))/sum(nc); r61=nc(6)/nc(1); %%%%%%%%
      if lennc>=30
         x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
         x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; 
         if min(x)>0
            xx=x(2:29)./x(1:28);
            if max(xx(16:25))>0.9, xx=1:30; end
         else
            xx=1:30;
         end
      else
         xx=1:30;
      end
   
      %non, r61, sum(xx(16:20))<sum(xx(21:25))
      if (non<0.6  &&  r61<0.71  &&  sum(xx(16:20))<sum(xx(21:25)) )  ||  (non<0.36 && r61<0.6) %trim:
         trim=uint8(1);
         qctr=1;

         delta=delta0;  T=0.8*delta;   %delta%%%%%%%%%%%%
         [qcf,ctr1]=quanTHD(sb,T,delta);    %ctr111111=ctr1%%%%%%%%%%%%%
         sn_z=sign(qcf); cf0=abs(qcf);
         maxc=max(cf0);
         if maxc>0
            bin=trim;
         else
            qnt=0; bin=[]; qcf=0;
         end
      else %no trim
         %22222%%%%%%%%%%%
         trim=uint8(0);
         if sum(nc(1:5))/sum(nc(6:15))>0.7071
            %111 %%%%%%%%%%
            qctr=1;
            T=0.52*delta0;
            qcf=quanTHD(sb,T,delta0);
            bin=[trim qctr];
         else
            %222 %%%%%%%%%%%
            qctr=0;
            [qcf,ctr1]=quantEVEN(sb,delta0);
            if ctr1>63, ctr1=63; end  
            bin=[trim qctr SFcode(ctr1+1,64)]; % SFcode(ctr2+1,64)];
      
            %nc=hist(abs(qcf),[1:max(abs(qcf))]);
            %sbr=rstEVENctr(qcf,delta0,nc,ctr1,ctr2);
            %e=sb-sbr; e=e.*e; e=sqrt(sum(sum(sum(e)))/length(qcf));
            %SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
         end
      end
            
   else %no trim
      %22222%%%%%%%%%%%%
      trim=uint8(0);
      if sum(nc(1:5))/sum(nc(6:15))>0.7071  &&  lennc/10<260
         qctr=1;
         T=0.52*delta0;
         qcf=quanTHD(sb,T,delta0);
         bin=[trim qctr];
      else
         qctr=0;
         [qcf,ctr1]=quantEVEN(sb,delta0);
         if ctr1>63, ctr1=63; end  
         if ctr1<0, ctr1=0; end 
         bin=[trim qctr SFcode(ctr1+1,64)]; % SFcode(ctr2+1,64)];
      end
   end
      
else
   qnt=0; bin=[]; qcf=0; qctr=1;
end
bin=[qnt bin]; 
