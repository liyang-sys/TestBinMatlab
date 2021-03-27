function [bin,xx,qcf]=en_sub3d(sub,n,delta0)

len=numel(sub);  sb=zeros(1,len);
for ia=1:len
   sb(ia)=sub(n(1,ia),n(2,ia),n(3,ia));
end
[qcf,binq,qctr]=quant_sub(sb,delta0); 
%-----------------------------------------
%    testDataMat = int32(qcf);
%    fid=fopen('mqcf.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'int32');
%    fclose(fid);
%-------------------------------------------
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
%------------------------------------------
%    testDataMat = int32(cf0);
%    fid=fopen('mqcf.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'int32');
%    fclose(fid);
%    
%    testDataMat = uint32(sn);
%    fid=fopen('msn.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'uint32');
%    fclose(fid);
  %--------------------------------------------------

   [bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));

   bin=[binq bin];
else
   bin=binq; xx=0;
end
%shist(cf0+1)
