function [qA,ctr1,ctr2]=quantEVEN(A,delta)

A = double(A);  
%absA = abs(A);
absA = abs(A) +1e-30; %<===== modified 2017/11/10 
absqA = ceil(absA/delta);
%qA = sign(A).*absqA;
qA = sign(sign(A)+0.5).*absqA; %<===== modified 2017/11/10

%-----------------------------------------------------------
wuns=ones(size(absqA));

val=1; quantized_1s=abs(sign(absqA-val));  
map = wuns - quantized_1s; 	%map of the value at 'val'
absA1=absA.*map;

Nmap1=sum(sum(sum(map)));
if Nmap1>0
   ctr1=sum(sum(sum(absA1)))/(Nmap1*delta)  -0.375;
   ctr1=round(ctr1/0.125*64);
else
   ctr1=63;
end
%a1=sum(map)

val=2; quantized2s=abs(sign(absqA-val));
map = wuns - quantized2s; 	%map of the value at 'val'
absA2 = absA.*map;

Nmap2=sum(sum(sum(map)));
if Nmap2>0
   ctr2 = sum(sum(sum(absA2)))/(Nmap2*delta) -1.375;
   ctr2=round(ctr2/0.125*64);
else
   ctr2=63;
end
%a2=sum(map)+a1
