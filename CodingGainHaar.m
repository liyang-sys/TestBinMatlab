function [gain,sig]=CodingGainHaar(sub)


subH=Haar(shiftdim(sub,2));  subH=shiftdim(subH,1);

sig=sum(sum(sum(sub.*sub)))/numel(sub);
s1=subH(:,:,1:48); s2=subH(:,:,49:96);
sigH1=sum(sum(sum(s1.*s1)))/numel(s1);
sigH2=sum(sum(sum(s2.*s2)))/numel(s2);

gain=10*log10(sig/(sigH1*sigH2)^0.5);
