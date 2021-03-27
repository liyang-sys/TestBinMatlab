function [sym,ptr] = deSFcode(bin,Nsym,ptr)

lb1=floor(log2(Nsym)); lb2=lb1+1;
Ngap = 2^lb2 - Nsym; %which is also the number of symbols coded at length lb1

code=char(bin(ptr:ptr+lb1-1)+48); ptr=ptr+lb1;
sym=bin2dec(code);
if sym > Ngap-1
   code=[code char(bin(ptr)+48)]; ptr=ptr+1; 
   sym=bin2dec(code)-Ngap;
end
sym=sym+1;  %This is to be consistant with coding runs, which starts from 1 not 0!