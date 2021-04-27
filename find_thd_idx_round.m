function idx=find_thd_idx_round(n,p,thd_arr)

sm=sum(n); psm=p*sm;
idx=1; ssm=n(1); lenn=length(n);
%while ssm < psm  &&  idx<24  &&  thd_arr(idx+1)<lenn
while ssm < psm  &&  idx<23  &&  thd_arr(idx+1)<lenn  %<===================== corrected on Jan 20, 2021
   ssm = ssm + sum(n(thd_arr(idx)+1:thd_arr(idx+1)));
   idx = idx+1;
end

if idx>1
   %if psm-sum(n(1:thd_arr(idx-1)))  <  sum( n(1:thd_arr(idx)))-psm  %<============================modified Oct 21, 2020
%    if (psm-sum(n(1:thd_arr(idx-1))) < sum( n(1:thd_arr(idx)))-psm)  ||  (lenn-thd_arr(idx)<=1) %<======modified Oct 21, 2020
%       idx=idx-1;
%    end
    sum1=sum(n(1:thd_arr(idx-1)));
    sum2=sum( n(1:thd_arr(idx)));
   if (psm- sum1< sum2-psm)  ||  (lenn-thd_arr(idx)<=1) %<======modified Oct 21, 2020
      idx=idx-1;
   end
end
