function qc=de_coef2D_double_deadzone(binary,delta)

[H0,ptr] = deSFcode(binary,1536,1); H0=int16(H0);
[W0,ptr] = deSFcode(binary,1536,ptr); W0=int16(W0);

   [qc,ptr]=de_coef2D_double_deadzone_sub(binary,H0,W0,ptr,delta);
