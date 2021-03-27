function [bin,sep]=en_z1(z)

[rz,lastBit]=Golomb0(z); 

lenr=length(rz);
bin_lenr = encode_stationary_source(lenr,17); %lennnn=length(bin_lenr)
[bin_z,sep]=en_runs_1sep(rz,0.8125,4,length(z),lastBit);

bin=[bin_lenr bin_z];
