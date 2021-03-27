function [sep,ptr]=de_runs_0seps(cbook,biny,ptr)

lastBit=biny(ptr); ptr=ptr+1;
[lenrs,ptr]=decode_stationary_source_lenr(biny,cbook,1,ptr);

[sym,ptr] = deSFcode(biny,10,ptr); codebook=sym-1;
%codebook=bin2dec(char(biny(ptr:ptr+2)+48));  ptr=ptr+3;

[rs,ptr]=decode_stationary_source_lenr(biny,codebook,lenrs,ptr);

sep=GolombInv(rs,lastBit);
