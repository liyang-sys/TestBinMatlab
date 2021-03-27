function [z1,ptr]=de_z1(biny,ptr)

[lenr,ptr]=decode_stationary_source_lenr(biny,17,1,ptr);

lastBit=biny(ptr); ptr=ptr+1;
[rz1,ptr]=de_runs_1sep(biny,lenr,4,ptr);

z1=GolombInv(rz1,lastBit);
