function [bin,sb,xx]=en_sub3d_dc5(sub,n,delta0)

sb=coef_scan2d(sub,n);

%    testDataMat = single(sb);
%    fid=fopen('mcf.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'single');
%    fclose(fid);

[qcf,binq,qctr]=quant_sub(sb,delta0); %ctr1 %%%%%%%%%%%%%%%%%

if binq(1)>0
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

%    testDataMat = int32(cf0);
%    fid=fopen('mcf0.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'int32');
%    fclose(fid);
%    
%    testDataMat = uint8(sn);
%    fid=fopen('msn.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'uint8');
%    fclose(fid);
%    
   [bin,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   

   bin=[binq bin];
else
   bin=binq; xx=0;
end
%shist(cf0+1)
