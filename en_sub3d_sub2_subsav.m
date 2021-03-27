function [bin2,cf2,nc2,thd2,cf2k,z2k]=en_sub3d_sub2_sub(cf1,nc1,thd2,cs)

incthd=0; 
if sum(nc1(1:thd2))/sum(nc1)<0.7, thd2=thd2*2; incthd=1; end
thd2h=thd2/2;
%thd2,incthd %%%%%%%%%%%%%%%%%%%%%%

[z2,cf2,cf2k]=separate(cf1,thd2);   cf2=cf2-thd2;  nc2k=nc1(1:thd2); nc2=nc1(thd2+1:length(nc1));
if cs==1
   %[r2,lB,p]=Golomb0(z2); lB=uint8(lB);  bin2=en_zone_sub(r2,[incthd lB]);  %<== encoding z2
   bin2=en_zone(z2); bin2=[incthd bin2];
elseif cs==2
   [r2,lB,p]=Golomb0(z2); lB=uint8(lB);  bin2=en_zone_sub2(r2,[incthd lB]);  %<== encoding z2
else
   bin2=en_z1(z2); bin2=[incthd bin2];
end

[z2k,cf2kw,cf2kk]=separate(cf2k,thd2h); cf2kw=cf2kw-thd2h; 
p2k=sum(z2k)/length(z2k); %%%%%%%%%%%%%%%%%%%%%%%
if p2k<0.35
   if cs==1
      %[r2k,lB,p]=Golomb0(z2k); lB=uint8(lB);  bin2b=en_zone_sub2(r2k,[0 lB]);
      bin2b=en_zone(z2k); bin2b=[0 bin2b];
   else
      bin2b=en_z1(z2k); bin2b=[0 bin2b];
   end
   %binx=en_zone_sub(r2k,[0 lB]); binx1=en_z1(z2k); binx2=en_z0(z2k);
   %[length(bin2b) length(binx) length(binx1) length(binx2)]
else
   bin2b=en_z0(z2k); bin2b=[1 bin2b];
end
if thd2>=4
   bin2c=en_2n_code(cf2kw,nc2k(thd2h+1:thd2));
   bin2d=en_2n_code(cf2kk,nc2k(1:thd2h));
   bin2=[bin2 bin2b bin2c bin2d];
else
   bin2=[bin2 bin2b];
end

