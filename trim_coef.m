function [cf0,dNnon,sn,cf1]=trim_coef(cf0,sn_z,abssb,delta,T0)
load Threshold

z=sign(cf0);

T=T*delta;
T2=[T0*T0 T.*T]; %T0*T0 is the energy directly after thresholding
sb2=abssb.*abssb;   sb2r=fliplr(sb2);
sbr=fliplr(abssb);


[cf0,dn]=trim_coef_1pix(cf0,abssb,delta,T); %dn %%%%%%%%%%%%% 
cc=cf0;
cf0=fliplr(cf0); 
[cf0,dn]=trim_coef_1pix(cf0,sbr,delta,T); cf0=fliplr(cf0);   %dn %%%%%%%%%%%%%
[cf0,dn]=trim_coef_1pix(cf0,abssb,delta,T);  %dn %%%%%%%%%%%%%


[cf0,dn]=trim_coef_2pix(cf0,abssb,delta,T,T2,sb2);  %dn2=dn %%%%%%%%%%%%%
%[cf0,dn]=trim_coef_2pix_sav(cf0,abssb,delta,T,T2,sb2);  %dn2=dn %%%%%%%%%%%%%
cf0=fliplr(cf0); [cf0,dn]=trim_coef_2pix(cf0,sbr,delta,T,T2,sb2r); cf0=fliplr(cf0);  %dn %%%%%%%%%%%%%
%cf0=trim_coef_2pix(cf0,abssb,delta,T,T2,sb2);


[cf0,dn]=trim_coef_3pix(cf0,abssb,delta,T,T2,sb2);  %dn3=dn %%%%%%%%%%%%%
cf0=fliplr(cf0); [cf0,dn]=trim_coef_3pix(cf0,sbr,delta,T,T2,sb2r); cf0=fliplr(cf0);  %dn %%%%%%%%%%%%%


[cf0,dn]=trim_coef_4pix(cf0,abssb,delta,T,T2,sb2);  %dn4=dn %%%%%%%%%%%%%
%cf0=fliplr(cf0); cf0=trim_coef_4pix(cf0,sbr,delta,T,T2,sb2r); cf0=fliplr(cf0);


[cf0,dn]=trim_coef_5pix(cf0,abssb,delta,T,T2,sb2);  %dn5=dn %%%%%%%%%%%%%

[cf0,dn]=trim_coef_1pix(cf0,abssb,delta,T); %dn %%%%%%%%%%%%%


%-------------------------------------------------------------------------------

zz=sign(cf0);
dNnon=(sum(z)-sum(zz))/sum(z); %%%%%%%%%%%%%%%%%%%%%
%(sum(z)-sum(zz)) %%%%%%%%%%%%%%%%%

len=length(cf0);

sn_z_trim=sign(cf0).*double(sn_z); sn=zeros(1,len); cf1=sn;
ptr=1;
for ia=1:len
   if cf0(ia)~=0
      cf1(ptr)=cf0(ia);
      sn(ptr)=sign(sn_z_trim(ia));
      ptr=ptr+1;
   end
end
sn=uint8(sign(sn(1:ptr-1)+1)); cf1=int16(cf1(1:ptr-1));



%-----------------------------------------------------------
%wuns=ones(size(cf0));

%val=1; quantized1s=abs(sign(cf0-val));  
%map = wuns - quantized1s; 	%map of the value at 'val'
%absA1=abssb.*map;
%ctr1 = 0.5 - (sum(absA1)/(sum(map)) -T0 )/delta;
%ctr1=round(ctr1/0.3*64);


