function [n,p]=shist(dat)

dat=double(dat);
if max(dat)<2
   r=Golomb0(dat);
else
   r=dat;
end

n=hist(r,[1:max(r)]);

figure; hist(r,[1:max(r)]);
if max(r)>69
   figure; bar(n(1:59));
end

p=length(r)/sum(r);