function thd=find_thd(n,p)

sm=sum(n); psm=p*sm;
thd=1; ssm=n(1);
while ssm < psm
   thd = thd+1;
   ssm = ssm + n(thd);
end

