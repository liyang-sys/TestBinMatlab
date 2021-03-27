N=size(a);


%coef=dy79decm(a);
%coef=Nondy79decm_3lev_PlusCFP2(a);
%coef=dy79decm_3lev_PlusCFP2(a);
%coef=dy79decm_4lev_PlusCFP2(a);
%Lev=6; coef=CFP2bd_Lev(a,Lev);

%M=4; lev=4; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%coef=coef_reorder(coef);
%M=16; lev=2; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP

%[coef,hh,gg,hhh,ggg]=SWP2modified(a,4); %coef=wp2tree(coef,4,2,1); %The latest version of SWP



M=8; lev=3; [coefy,fL]=LFP2(y,M);  tanTheta=1/8; coefy=block2bd(coefy,M,lev,tanTheta);
%coefy=coef_reorder(coefy);
M=8; lev=3; [coefu,fL]=LFP2(u,M);  tanTheta=1/8; coefu=block2bd(coefu,M,lev,tanTheta);
%coefu=coef_reorder(coefu);
M=8; lev=3; [coefv,fL]=LFP2(v,M);  tanTheta=1/8; coefv=block2bd(coefv,M,lev,tanTheta);
%coefv=coef_reorder(coefv);

