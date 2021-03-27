function [bin,xx,qcf]=en_sub3d3_dc5(sub,sub2,sub3,n,delta0)

%[cf_tem,abssb,sb]=coef_scan3d(sub,sub,n);
%[cf_tem,abssb,sb2]=coef_scan3d(sub2,sub2,n);
%[cf_tem,abssb,sb3]=coef_scan3d(sub3,sub3,n);
sb=coef_scan2d(sub,n);
sb2=coef_scan2d(sub2,n);
sb3=coef_scan2d(sub3,n);

sb=[sb sb2 sb3];

[qcf,binq,qctr]=quant_sub(sb,delta0); %ctr1 %%%%%%%%%%%%%%%%%

if binq(1)>0
   len=length(qcf);
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

   %shist(cf0+1) %%%%%%%%%%%%

   [bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   %[cfr,sn,ptr,cfw]=de_sub3d_sub2(bin,length(cf0),qctr,1)

   bin=[binq bin];
else
   bin=binq; xx=0;
end
%length(cf0), maxc=max(cf0)
%shist(cf0+1)
