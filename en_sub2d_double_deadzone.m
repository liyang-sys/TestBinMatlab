function [bin,xx,qcf]=en_sub2d_double_deadzone(sub,n,delta0)

len=numel(sub);  
if n~=-1
   sb=zeros(1,len);
   for ia=1:len
      sb(ia)=sub(n(1,ia),n(2,ia));
   end
else
   sb=sub;
end


qcf=quanTHD(sb,delta0,delta0); %double deadzone quantization

if max(abs(qcf))>=1
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

   [bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   bin=[1 bin];
else
   bin=0; xx=0; qcf=0;
end
