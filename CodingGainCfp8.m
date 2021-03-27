function [gain,sig,subH]=CodingGainCfp8(sub)

sig=sum(sum(sum(sub.*sub)))/numel(sub);

subH=transform_time_domain_cfp(sub,8);
sigs=zeros(1,8);     L=size(sub,3)/8;
for ia=1:8
   ss=subH(:,:,(ia-1)*L+1:ia*L);
   sigs(ia)=sum(sum(sum(ss.*ss)))/numel(ss);
end
gain=10*log10(sig/(prod(sigs))^0.125);
