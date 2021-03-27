function [gain,sig,subH]=CodingGainCfp4(sub,lev)

subH=transform_time_domain_cfp(sub,4);

sig=sum(sum(sum(sub.*sub)))/numel(sub);
s1=subH(:,:,1:24); s2=subH(:,:,25:48); s3=subH(:,:,49:72); s4=subH(:,:,73:96);
sigH1=sum(sum(sum(s1.*s1)))/numel(s1);
sigH2=sum(sum(sum(s2.*s2)))/numel(s2);
sigH3=sum(sum(sum(s3.*s3)))/numel(s3);
sigH4=sum(sum(sum(s4.*s4)))/numel(s4);

gain=zeros(1,2);
gain(1)=10*log10(sig/(sigH1*sigH2*sigH3*sigH4)^0.25);


if lev==3
   L=size(sub,3)/4;   hL=L/2;

   s1=Haar(shiftdim(s1,2));  s1=shiftdim(s1,1);
   subH(:,:,1:L)=s1;
   
   sigs=zeros(1,8);
   for ia=1:8
      ss=subH(:,:,(ia-1)*hL+1:ia*hL);
      sigs(ia)=sum(sum(sum(ss.*ss)))/numel(ss);
   end
   gain(2)=10*log10(sig/(prod(sigs))^0.125);
end      
