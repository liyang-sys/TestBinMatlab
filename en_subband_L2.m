function [bin,z,z10]=en_subband_L2(subband)

[cf0,z,sn,cf1]=coef_sign(subband);
maxcf0=double(max(cf0));
%max_mean=[maxcf0 mean(double(cf1))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if maxcf0>=16
   [bin,z,z10]=en_subband_sub1_L2(cf0,z,sn,maxcf0);   bin=[1 bin];
else
   [bin,z]=en_subband_sub2_L2(cf0,z,sn,maxcf0,cf1);   bin=[0 bin];
end
