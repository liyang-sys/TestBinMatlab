function [qcf,bin,ctr1,sn,cf1]=quant_sub(sb,sub,delta0)

[cf,ctr1,ctr2]=quantEVEN(sb,delta0/10); abscf=abs(cf);
lennc=max(abscf);  %note: the mininum of cf is 1 here, not 0.
nc=hist(abscf,1:lennc); 

dd=1/128; abssb=abs(sb);
if nc(6)>0
   qnt=1;
   non=sum(nc(6:lennc))/sum(nc); r61=nc(6)/nc(1); %%%%%%%%

   if lennc>=30 
      x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
      x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; xx=x(2:29)./x(1:28);
      if max(xx(16:25))>0.9, xx=1:30; end
   else
      xx=1:30;
   end
   
   if non<0.6  &&  r61<0.71  &&  sum(xx(16:20))<sum(xx(21:25))  %trim:
      trim=uint8(1);

      [t,h,t2,h2]=find_T_and_Del(sub,delta0); 
      mag=round((h2-1)/dd);  if mag>=26, mag=26; end
      
      delta=(1+mag*dd)*delta0;  T=0.55*delta;
      [qcf,ctr1]=quanTHD(sb,T,delta);    %ctr111111=ctr1%%%%%%%%%%%%%
      sn_z=sign(qcf); cf0=abs(qcf);
      
      
      
      [cf0tr,dNnon]=trim_coef(cf0,sn_z,abssb,delta,T); dNnon %%%%%%%%%%%%%%
      qcf=cf0tr.*sn_z;
      
      
      
      bin=[trim SFcode(mag+1,27)];
   else %no trim
      trim=uint8(0);
      if sum(nc(1:5))/sum(nc(6:15))>0.7071
         qctr=1;
         T=0.52*delta0;
         qcf=quanTHD(sb,T,delta0);
         bin=[trim qctr];
      else
         qctr=0;
         [qcf,ctr1,ctr2]=quantEVEN(sb,delta0);
         bin=[trim qctr SFcode(ctr1+1,64) SFcode(ctr2+1,64)];
      
         %nc=hist(abs(qcf),[1:max(abs(qcf))]);
         %sbr=rstEVENctr(qcf,delta0,nc,ctr1,ctr2);
         %e=sb-sbr; e=e.*e; e=sqrt(sum(sum(sum(e)))/length(qcf));
         %SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
      end
   end
else
   qnt=0;
end
bin=[qnt bin];


len=length(qcf);
cf0=abs(qcf); sn_z=sign(qcf);
sn=zeros(1,len); cf1=sn;
ptr=1;
for ia=1:len
   if cf0(ia)~=0
      cf1(ptr)=cf0(ia);
      sn(ptr)=sign(sn_z(ia));
      ptr=ptr+1;
   end
end
sn=uint8(sign(sn(1:ptr-1)+1)); cf1=int16(cf1(1:ptr-1));



%qnt,trim,%qctr %%%%%%%%%%%%%%%%%%%%%%%
