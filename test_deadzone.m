delta0=6.8323;
%delta0=8; <====== check for T*0.7

%delta=[0.8*delta0 0.9*delta0 delta0 1.1*delta0 1.2*delta0 1.3*delta0];  T=0.55*delta;
T=[0.55*delta0  0.6*delta0 0.65*delta0 0.72*delta0  0.8*delta0  0.85*delta0]; delta=delta0*ones(1,6); 

snr=zeros(1,6); lenbits=zeros(1,6);
for ia=1:6
   qcf=quanTHD(sub,T(ia),delta(ia));
   [cf0,abssb,sb,sn_z,z,sn,cf1]=coef_scan3d(sub,qcf,n);

   %[t,h,t2,h2]=find_T_and_Del(sub,delta(ia)); 
   %th=[t,h,t2 h2]
   
   %subr=rstTHDctr1(qcf,T(ia),delta(ia),0.42*delta(ia),0.46*delta(ia));


   %[cf0,  dNnon]=trim_coef(cf0,sn_z,abssb,delta(ia),T(ia)); dNnon %%%%%%%%%
   qcf=cf0.*double(sn_z);
  

   nc=hist(double(cf0+1),[1:max(double(cf0+1))]);
   sbr=rstTHDctr(qcf,T(ia),delta(ia),nc);
   e=sb-sbr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
   SNR0=20*log10(256/e);
   
   
   len=length(cf0);
   cf0=abs(qcf); sn_z=sign(qcf);
   sn=zeros(1,len); cf1=sn;
   ptr=1;
   for ib=1:len
      if cf0(ib)~=0
         cf1(ptr)=cf0(ib);
         sn(ptr)=sign(sn_z(ib));
         ptr=ptr+1;
      end
   end
   sn=uint8(sign(sn(1:ptr-1)+1)); cf1=int16(cf1(1:ptr-1));
   
   
   snr(ia)=SNR0;
   
   [biny,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   qctr=1;
   [cfr,snrec,ptr,cfw]=de_sub3d_sub2(biny,length(cf0),qctr,1); ptr %%%%%%%%%%
   
   figure; plot(double(cfr)-double(cf0).*double(sn_z))

   lenbits(ia)=length(biny);
   fprintf('\n------------------------------------------------------\n\n\n')
end
