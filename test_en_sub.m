i1=6; i2=1;
subband=subL2{i1,i2,1};
sz=size(subband);



%[biny,z,z10]=en_subband_L2(subband);
%[biny,cf0,z]=en_subband_L1(subband);
%L=length(biny)/8



%[subbandr,ptr]=de_subband_L2(biny,sz,1);   
%[subbandr,ptr]=de_subband_L1(biny,sz,1);
%maxerr=max(max(abs(subbandr-subband))) %%%%%%%%%%%%%%%%%%%%

%[biny,cf0]=en_subband_L3(subband,0);
%L3=length(biny)/8
[biny,cf0]=en_subband_L4(subband,0);
L4=length(biny)/8
[biny,cf0]=en_subband_L5(subband,0);
L5=length(biny)/8
%[subband1,ptr]=de_subband_L2(biny,sz,1);
%maxerr=max(max(abs(subband1-subband))) %%%%%%%%%%%%%%%%%%%%


fprintf('===========================================================================\n\n')
