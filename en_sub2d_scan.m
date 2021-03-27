function [bin,xx,qcf]=en_sub2d_scan(sb,delta0)

len=length(sb);
[qcf,binq,qctr]=quant4image_sb(sb,delta0); %qctr %qctr=0 corresponds to "quantEVEN.m"
   
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
