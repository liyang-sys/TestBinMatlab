function [bin,cf0,z]=en_subband_L1(subband)

%[cf0,z,sn,cf1]=coef_signH3L1(subband);
[cf0,z,sn,cf1]=coef_sign(subband);

maxcf0=double(max(cf0));
%max_mean=[maxcf0 mean(double(cf1))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if maxcf0>=20
   [bin,z,z2]=en_subband_sub1(cf0,z,sn,maxcf0);   bin=[1 bin];
else
   [bin,z,z2]=en_subband_sub2(cf0,z,sn,maxcf0,cf1);   bin=[0 bin];
end
