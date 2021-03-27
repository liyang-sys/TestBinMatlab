function [mc,rat,saving,delta,qb]=find_metricVal_sub(A,mc0,delta,rate0,check,f)

[H,W]=size(A);
M=8; lev=3; [coef,fL]=LFP2(A,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%coef=coef_reorder(coef);
coef0=coef;

en_coef_check_metricVal; %<======================= 'check' is hidden here !!!!!!!!!!!!!!!!!!
eer0=mc-mc0 

SN0=SN; delta0=delta;
if eer0<0
   delta=delta*(1-1/20); 
else
   delta=delta*(1+1/20); 
end
delta %%%%%%%%%%%%%%%%

coef=coef0;
en_coef_check_metricVal;
eer=mc-mc0; 

iter=0;
while abs(eer/(1-mc0))>0.0001  &&  iter<10
   iter=iter+1
   delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta;
   delta0=delta; eer0=eer; 
   
   delta=delta2 %%%%%%%%%%%%%%%%%%%%
   coef=coef0;
   en_coef_check_metricVal;
   eer=mc-mc0 
   fprintf('-------------------------------------------------------------------------\n\n')
end
rat=length(binary)/numel(qb);
saving=100*(rat-rate0)/rate0;
