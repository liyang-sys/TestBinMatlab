function [biny,cf0]=en_subband_L5(subband,aspect)

if aspect==0
   [cf0,z,sn,cfnon]=coef_sign(subband);
else
   N=size(subband);
   lev=log2(2560/N(1));
   [cf0,z,sn,cfnon]=coef_sign54(subband,lev);
end
maxcf0=double(max(cf0));
%max_mean=[maxcf0 mean(double(cfnon))]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cf0=cf0+1; %<=== treat cf0 as runs!
p0=length(cf0)/sum(cf0);
[biny,codebook]=encode_stationary_source(cf0, p0); %codebook %%%%%%%%%

biny=[uint8(SFcode(codebook+1,20)) biny sn];
