function [sub,ptr]=de_sub3d(bin,len,delta0,n,ptr)

[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr
if binq(1)>0
    %-----------------------------------------------------
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr);
   %------------------------------------------------
   
   [sbr,ptrq]=rst_sub(binq,qcfr,delta0,1);
%    testDataMat = single(qcfr);
%    fid=fopen('mcf0.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%    fwrite(fid,testDataMat,'int32');
%    fclose(fid);
   
else
   sbr=zeros(1,len);
end
sub=coef_scan3d_inv(sbr,n);
