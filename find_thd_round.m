function thd=find_thd_round(n,p)

sm=sum(n);
thd=1; ssm=n(1);
while ssm < p*sm
   thd = thd+1;
   ssm = ssm + n(thd);
end

if p-sum(n(1:thd-1))/sm < sum(n(1:thd))/sm-p
   thd=thd-1;
end
