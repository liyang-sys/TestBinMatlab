function [sub,ptr]=de_sub3d_dc5(bin,len,delta0,n,h,w,ptr)

[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr
if binq(1)>0
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr); %ptr %%%%%%%%%%
   [sbr,ptrq]=rst_sub(binq,qcfr,delta0,1);
   
%    testDataMat = single(sbr);
%    fid=fopen('remcf.txt','w'); %д�ķ�ʽ���ļ����������ڣ������ļ�����
%    fwrite(fid,testDataMat,'single');
%    fclose(fid);
   
%    fid=fopen('mcf1.txt','w'); %д�ķ�ʽ���ļ����������ڣ������ļ�����
%    fwrite(fid,int32(qcfr),'int32');
%    fclose(fid);
   
else
   sbr=zeros(1,len);
end
sub=coef_scan2d_inv(sbr,h,w,n);
