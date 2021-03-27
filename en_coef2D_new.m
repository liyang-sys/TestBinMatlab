function binary=en_coef2D_new(coef,H0,W0,delta,binary)

%N=int16(size(coef)); H0=bitshift(N(1),-3); W0=bitshift(N(2),-3); 
%binary=SFcode(H0,1536);  binary=[binary SFcode(W0,1536)];

Nsub=bitshift(int32(numel(coef)),-2);
if Nsub<=bitshift(int32(2),18)
   binary=en_coef2D_new_sub1(coef,delta,H0,W0,binary);
elseif Nsub<=bitshift(int32(2),20)
   binary=en_coef2D_new_sub2(coef,delta,H0,W0,binary);
else
   binary=en_coef2D_new_sub3(coef,delta,H0,W0,binary);
end
