function [qcf,bin,qctr]=quant_sub(sb,delta0)

cf=quantEVEN(sb,delta0/10); abscf=abs(cf); 
lennc=max(abscf);  %note: the mininum of abscf is 1 here, not 0.
nc=hist(abscf,[1:lennc]); 

%delta0,nc%%%%%%%%%%%%%%%
dd=1/128; abssb=abs(sb);
%if nc(6)>0 
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

         %modified 25/03/15, to consider Gaussian-like distributions:
         %[t,h,t2,h2]=find_T_and_Del_sav(sb,delta0); h,h2 %%%%%%%%%%
         %mag=round((h2-1)/dd);  if mag>=26, mag=26; end
         frac=0.75; [t,h,t2,h2,maxc]=find_T_and_Del(sb,delta0,frac); %h,h2 %%%%%%%%%%

         if maxc>0
            mag=round((h-1)/dd);  if mag>=26, mag=26; end;     %mag %%%%%%%%%%

            delta=(1+mag*dd)*delta0;  T=0.55*delta;   %delta%%%%%%%%%%%%
            [qcf,ctr1]=quanTHD(sb,T,delta);    %ctr111111=ctr1%%%%%%%%%%%%%
            sn_z=sign(qcf); cf0=abs(qcf);
      
            %modified 27/03/15: 'delta' should be 'delta0' here!!!!!
            %[cf0tr,dNnon,sn,cf1tr]=trim_coef(cf0,sn_z,abssb,delta,T); dNnon %%%%%%%%%%%%%%
            lenT=131072; len=length(cf0);
            if len>lenT
               NT=len/lenT;
               for ia=0:NT-1
                  idx = ia*lenT+1 : (ia+1)*lenT;
                  [cf0tr(idx),dNnon]=trim_coef(cf0(idx),sn_z(idx),abssb(idx),delta0,T); %dNnon
               end
            else
               [cf0tr,dNnon,sn,cf1tr]=trim_coef(cf0,sn_z,abssb,delta0,T); %dNnon,non,r61 %%%%%%%%%%%%%%
            end
            qcf=cf0tr.*sn_z;
      
            if max(cf0tr)>0
               bin=[trim SFcode(mag+1,27)];
            else
               qnt=0; bin=[]; qcf=0;
            end
         else
            qnt=0; bin=[]; qcf=0;
         end
      else %no trim
         %22222%%%%%%%%%%%
         trim=uint8(0);
         %if sum(nc(1:5))/sum(nc(6:15))>0.7071
         if sum(nc(1:5))/sum(nc(6:15))>0.7071 || min(abscf)==0 %modified Oct 5, 2017
            qctr=1;
            T=0.52*delta0;
            qcf=quanTHD(sb,T,delta0);
            bin=[trim qctr];
         else
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
      %if sum(nc(1:5))/sum(nc(6:15))>0.7071  &&  lennc/10<260
      if (sum(nc(1:5))/sum(nc(6:15))>0.7071  &&  lennc/10<260) || min(abscf)==0 %modified Oct 5, 2017
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
