function [bin,xx,qcf]=en_sub2d_new(sub,n,delta0)

len=numel(sub);  
if n~=-1
   sb=zeros(1,len);
   for ia=1:len
      sb(ia)=sub(n(1,ia),n(2,ia));
   end
else
   sb=sub;
end
[qcf,binq,qctr]=quant4image_sb(sb,delta0); %qctr %qctr=0 corresponds to "quantEVEN.m"
%[qcf,binq,qctr]=quant4image_sb_tem(sb,delta0); %qctr %qctr=0 corresponds to "quantEVEN.m"
%[qcf,binq,qctr]=quant4image_sub(sb,delta0); %qctr %qctr=0 corresponds to "quantEVEN.m"
%[qcf,binq,qctr]=quant4image_sub_new(sb,delta0); %qctr %qctr=0 corresponds to "quantEVEN.m"

if binq(1)>0
   if qctr==1
      sn=zeros(1,len);
      cf0=abs(qcf);
      lensn=0;
      for ia=1:len
         if qcf(ia)>0
            lensn=lensn+1;
            sn(lensn)=1;
         elseif qcf(ia)<0
            lensn=lensn+1;
         end
      end
      sn=sn(1:lensn);
   else
      %~~~~~~~~~~~ added 05/10/17 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      if min(abs(qcf))==0 %This happens ocasionally!!! 
         for ia=1:len
            if qcf(ia)==0, qcf(ia)=1; end
         end
      end
      %~~~~~~~~~~~ added 05/10/17 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      cf0=abs(qcf)-1;
      sn=sign(1+sign(qcf));
   end   
   [bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   %[qcfr,sn,ptr]=de_sub3d_sub2(bin,length(cf0),qctr,1); ptr %%%%%%%%%%
   %diff=max(abs(cf0-abs(qcfr)))

   bin=[binq bin];
else
   bin=binq; xx=0;
end
%shist(cf0+1)
