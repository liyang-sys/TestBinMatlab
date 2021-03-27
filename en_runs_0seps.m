function biny=en_runs_0seps(sep,cbook,biny)

[rs,lastBit,ps]=Golomb0(sep);  biny=[biny lastBit];
lenrs=length(rs);
bin = encode_stationary_source(lenrs,cbook); biny=[uint8(biny) bin];
[bin,codebook]=encode_stationary_source(rs,ps); 

%modified on Jan 6, 2020 : ==============================================
if codebook>9,
   codebook=9;
   [bin,codebook]=encode_stationary_source(rs,codebook); 
end
%========================================================================

codebook=SFcode(codebook+1,10);

biny=[uint8([biny codebook])  bin];
