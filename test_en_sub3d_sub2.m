clear;
% fileID = fopen('mCf.txt');
fileID = fopen('CF0.txt');
cf= fread(fileID,'int32');
cf=cf';
fclose(fileID);

% fileID = fopen('mSn.txt');
% sn= fread(fileID,'uint32');
% sn=sn';
sn=binIn('SN.txt');
for ia=1:12383
    snCopy(ia)=sn(ia);
end
zzz=max(cf);
[bin,xx]=en_sub3d_sub2(cf,snCopy,max(cf));
% fclose(fileID);
     fid=fopen('mbin.txt','w'); %д�ķ�ʽ���ļ����������ڣ������ļ�����
     fwrite(fid,uint8(bin),'uint8');
     fclose(fid);
 qctr = 1;
 len=length(cf);
 ptr= 1;
 [cfInv,sn,ptr,cfw]=de_sub3d_sub2(bin,len,qctr,ptr);
     fid=fopen('mQcf.txt','w'); %д�ķ�ʽ���ļ����������ڣ������ļ�����
     fwrite(fid,int32(cfInv),'int32');
     fclose(fid);
% [z1,cfk1,ptr]=de_sub3d_sub2_sub(bin,1,len,ptr);

zzzz =sum(z1);