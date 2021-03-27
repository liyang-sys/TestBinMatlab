function [runs,inv]=inversion_check(runs)

if length(runs)*2>sum(runs)
   inv=1;
   runs=KW_inversion_runs(runs);
else
   inv=0;
end
