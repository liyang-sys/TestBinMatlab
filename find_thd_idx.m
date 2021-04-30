function idx=find_thd_idx(n,p,th)

%save temp n p th

sm=sum(n); psm=p*sm;
idx=1; ssm=n(1);
%while ssm < psm    %<=============================== modified Apr. 28, 2021 
while ssm < psm  &&  idx<24%<=============================== modified Apr. 28, 2021
   ssm = ssm + sum(n(th(idx)+1:th(idx+1)));
   idx = idx+1;
end

%=================modified (added) Oct 22, 2020 =================
if length(n)-th(idx) <= 2
   idx=idx-1;
end
%=================modified (added) Oct 22, 2020 =================

% function idx=find_thd_idx(n,p,th)
% 
% sm=sum(n); psm=p*sm;
% idx=1; ssm=n(1);
% while ssm < psm
%    ssm = ssm + sum(n(th(idx)+1:th(idx+1)));
%    idx = idx+1;
% end
% 
% %=================modified (added) Oct 22, 2020 =================
% if length(n)-th(idx) <= 2
%    idx=idx-1;
% end
%=================modified (added) Oct 22, 2020 =================
