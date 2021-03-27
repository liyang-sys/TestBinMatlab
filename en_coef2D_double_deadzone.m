function binary=en_coef2D_double_deadzone(coef,delta)

N=int16(size(coef)); H0=bitshift(N(1),-3); W0=bitshift(N(2),-3); Nsub=bitshift(int32(numel(coef)),-2);
binary=SFcode(H0,1536);  binary=[binary SFcode(W0,1536)];

   binary=en_coef2D_double_deadzone_sub(coef,delta,H0,W0,binary);
