function [bin,qcf,binq]=en_sub(sub,n,delta0)

[cf_tem,abssb,sb]=coef_scan3d(sub,sub,n);
[qcf,binq,qctr]=quant_sub(sb,delta0); %ctr1 %%%%%%%%%%%%%%%%%

len=length(qcf);
if qctr==1
   sn=zeros(1,length(n));
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

%mincf0=min(cf0) %%%%%%%%%%%%%%
%lensn=length(sn) %%%%%%%%%%%%%%

[bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
%[qcfr,snrec,ptr]=de_sub3d_sub2(bin,length(qcf),qctr,1); ptrrrr=ptr %%%%%%%%%%

binq
bin=[binq bin];
