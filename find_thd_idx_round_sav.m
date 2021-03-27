function idx=find_thd_idx_round(n,p,thd_arr)

sm=sum(n); psm=p*sm;
idx=1; ssm=n(1); lenn=length(n);
while ssm < psm  &&  idx<24  &&  thd_arr(idx+1)<lenn
   ssm = ssm + sum(n(thd_arr(idx)+1:thd_arr(idx+1)));
   idx = idx+1;
end


if idx>1
   %if p-sum(n(1:thd_arr(idx-1)))/sm  <  sum( n(1:thd_arr(idx)))/sm-p
   if psm-sum(n(1:thd_arr(idx-1)))  <  sum( n(1:thd_arr(idx)))-psm
      idx=idx-1;
   end
end
