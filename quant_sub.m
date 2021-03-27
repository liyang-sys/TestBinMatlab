function [qcf,bin,qctr]=quant4image_sb(sb,delta0)
%This version is directly adapted from quant4image_sb.m 

cf=quantEVEN(sb,delta0/10); abscf=abs(cf); 
lennc=max(abscf);  %note: the mininum of abscf is 1 here, not 0.
nc=hist(abscf,[1:lennc]); 

abssb=abs(sb);

if lennc>=6
   qnt=1;
  
   if lennc/10<120 || delta0>2 %modified Jan 16, 2021
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
   
      if (non<0.6  &&  r61<0.71  &&  sum(xx(16:20))<sum(xx(21:25)) )  ||  (non<0.36 && r61<0.6) %trim:
         trim=uint8(1);
         qctr=1;

         delta=delta0;  T=0.55*delta;   %delta%%%%%%%%%%%%
         [qcf,ctr1]=quanTHD(sb,T,delta);    %ctr111111=ctr1%%%%%%%%%%%%%
         sn_z=sign(qcf); cf0=abs(qcf);
         maxc=max(cf0);
         if maxc>0
            %modified 24/10/2017: =====================================================================
            lenT=131072; len=length(cf0); cf0tr=cf0;
            if len>lenT
               NT=floor(len/lenT);
               for ia=0:NT-1
                  ntem=(ia+1)*lenT;
                  idx = ia*lenT+1 : ntem;
                  [cf0tr(idx),dNnon]=trim_coef(cf0(idx),sn_z(idx),abssb(idx),delta0,T); %dNnon
               end
               if len>ntem
                  idx=ntem+1:len;
                  [cf0tr(idx),dNnon]=trim_coef(cf0(idx),sn_z(idx),abssb(idx),delta0,T); %dNnon
               end
               %=======================================================================================
            else
               [cf0tr,dNnon,sn,cf1tr]=trim_coef(cf0,sn_z,abssb,delta0,T); %dNnon,non,r61 %%%%%%%%%%%%%%
            end
            qcf=cf0tr.*sn_z;
      
            if max(cf0tr)>0
               %bin=[trim SFcode(mag+1,32)];  % <================= deleted Jan 6, 2021 !!!
               bin=trim;
            else
               qnt=0; bin=[]; qcf=0;
            end
         else
            qnt=0; bin=[]; qcf=0;
         end
      else %no trim
         trim=uint8(0);
         if (sum(nc(1:5))/sum(nc(6:15))>0.7071)  ||  (nc(1)/nc(2)>1.4  && nc(1)>35)  %modified September 26, 2020
            qctr=1;
            T=0.52*delta0;
            qcf=quanTHD(sb,T,delta0);
            bin=[trim qctr];
         else
            qctr=0;
            [qcf,ctr1]=quantEVEN(sb,delta0);
            if ctr1>63, ctr1=63; end  
            if ctr1<0, ctr1=0; end %<===== modified 2017/11/10 !!!
            bin=[trim qctr SFcode(ctr1+1,64)]; % SFcode(ctr2+1,64)];
         end
      end
   else %no trim
      trim=uint8(0);
      if (sum(nc(1:5))/sum(nc(6:15))>0.7071  &&  lennc/10<260)  ||  (nc(1)/nc(2)>1.4  && nc(1)>35)  %modified September 26, 2020  
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
