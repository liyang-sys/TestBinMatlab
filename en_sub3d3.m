function [bin,xx,qcf]=en_sub3d3(sub,sub2,sub3,n,delta0)

%[cf_tem,abssb,sb]=coef_scan3d(sub,sub,n);
%[cf_tem,abssb,sb2]=coef_scan3d(sub2,sub2,n);
%[cf_tem,abssb,sb3]=coef_scan3d(sub3,sub3,n);

len0=numel(sub);  sb=zeros(1,len0); sb2=sb; sb3=sb;
for ia=1:len0
   sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
   sb2(ia)=sub2(n(1,ia),n(2,ia),n(3,ia));
   sb3(ia)=sub3(n(1,ia),n(2,ia),n(3,ia));
end

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
