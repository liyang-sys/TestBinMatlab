function prob=probility_estimation(rk,nk)

prb1=prob_est(nk); prb2=length(rk)/sum(rk);

thd=max(rk);
if thd <=7 && length(rk)>360 %<=========================== modified 2013/08/02
   prob=prb1;
elseif thd<=12
   prob=(prb1+prb2)/2;
else
   prob=prb2;   
end %<==================================================== revised 2013/06/02
