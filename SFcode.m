function code = SFcode(sym,Nsym)

lb1=floor(log2(Nsym)); lb2=lb1+1;
Ngap = 2^lb2 - Nsym; %which is also the number of symbols coded at length lb1

sym=sym-1; %This is to be consistant with coding runs, which starts from 1 not 0!
if sym <= Ngap-1
   code = dec2bin(sym,lb1);
else
   code = dec2bin(sym+Ngap,lb2);
end

code=uint8(abs(code)-48);
