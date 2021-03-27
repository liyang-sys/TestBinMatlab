function [qc,ptr]=de_coef2D_new(binary,delta,H0,W0,Nsub,ptr)

%[H0,ptr] = deSFcode(binary,1536,ptr); H0=int16(H0);
%[W0,ptr] = deSFcode(binary,1536,ptr); W0=int16(W0);
%Nsub=bitshift(int32(H0)*int32(W0),4);

if Nsub<=bitshift(int32(2),18)
   [qc,ptr]=de_coef2D_new_sub1(binary,H0,W0,ptr,delta);
elseif Nsub<=bitshift(int32(2),20)
   [qc,ptr]=de_coef2D_new_sub2(binary,H0,W0,ptr,delta);
else
   [qc,ptr]=de_coef2D_new_sub3(binary,H0,W0,ptr,delta);
end
