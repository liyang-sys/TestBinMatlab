function [bin,qcoef]=en_residue(sub,n,delta0)

delta=1.1*delta0; %<==================
T=0.5*delta %%%%%%%%%%%%%%%%%%%%
[qcf,ctr1]=quanTHD(sub,T,delta);  ctr=0.5-ctr1 %%%%%%%%%%%%
clear sub
qcf=int16(qcf);
qcoef=single(rstTHDctr1(qcf,T,delta,ctr*delta,0.16*delta));

len=numel(qcf); cf0=int16(zeros(1,len)); sn=uint8(zeros(1,len));
lensn=0;
for ia=1:len
   cf0(ia)=qcf(n(1,ia),n(2,ia),n(3,ia));
   if cf0(ia)>0
      lensn=lensn+1;
      sn(lensn)=1;
   elseif cf0(ia)<0
      lensn=lensn+1;
   end
end
lensn,len %%%%%%%%%%%%%%%%%
sn=sn(1:lensn);
clear qcf n

cf0=abs(cf0);

whos %%%%%%%%%%%%%%%%
bin=en_sub3d_sub2(cf0,sn,max(cf0));
