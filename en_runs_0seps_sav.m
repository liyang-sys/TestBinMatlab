function biny=en_runs_0seps(sep,cbook,biny)

[rs,lastBit,ps]=Golomb0(sep);  biny=[biny lastBit];
lenrs=length(rs);
bin = encode_stationary_source(lenrs,cbook); biny=[uint8(biny) bin];
[bin,codebook]=encode_stationary_source(rs,ps); %codebook
%codebook=SFcode(codebook+1,10);
codebook=SFcode(codebook+1,16);  %modified Oct 20, 2020

biny=[uint8([biny codebook])  bin];
