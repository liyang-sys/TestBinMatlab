%load Cactus_96frames
%load ParkScene_96frames; a=a/4;
%load Kimono_96frames; a=a/4;
%load CrowdRun_96frames; a=a/4;
load BQTerrace_96frames;
%load OldTownCross_96frames; a=a/4;



whos
%coef=transform_time_domain(a);
%[coef,fL]=transform_time_domainB(a);
%coef=transform_3d_cfp8(a);
[coef,fL]=transform_3d_cfp8B(a);
whos

%b=transform_time_domain_inv(coef);
%b=transform_time_domainB_inv(coef,fL);
%b=transform_3d_cfp8_inv(coef);
b=transform_3d_cfp8B_inv(coef,fL);
err=max(max(max(abs(double(b)-double(a))))), maxmag=max(max(max(abs(b)))) %%%%%%%%%


%save Cactus_cfp8_3d_transformed_5lev coef
%save ParkScene_cfp8_3d_transformed_5lev coef
%save Kimono_cfp8_3d_transformed_5lev coef
%save CrowdRun_cfp8_3d_transformed_5lev coef
%save BQTerrace_cfp8_3d_transformed_5lev coef
%save OldTownCross_cfp8_3d_transformed_5lev coef

%save Cactus_cfp8_3d_transB_5lev coef fL
%save ParkScene_cfp8_3d_transB_5lev coef fL
%save Kimono_cfp8_3d_transB_5lev coef fL
%save CrowdRun_cfp8_3d_transB_5lev coef fL
save BQTerrace_cfp8_3d_transB_5lev coef fL
%save OldTownCross_cfp8_3d_transB_5lev coef fL
