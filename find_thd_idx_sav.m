function idx=find_thd(n,p,th)

sm=sum(n); psm=p*sm;
idx=1; ssm=n(1);
while ssm < psm
   ssm = ssm + sum(n(th(idx)+1:th(idx+1)));
   idx = idx+1;
end

