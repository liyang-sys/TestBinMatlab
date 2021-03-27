function [bin,cf0,z]=en_subband_L1_H3(subband)

[cf0,z,sn,cf1]=coef_sign_H3(subband);
maxcf0=double(max(cf0));
max_mean=[maxcf0 mean(double(cf1))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if maxcf0>=20
   [bin,z,z2]=en_subband_sub1(cf0,z,sn,maxcf0);   bin=[1 bin];
else
   [bin,z,z2]=en_subband_sub2(cf0,z,sn,maxcf0,cf1);   bin=[0 bin];
end
