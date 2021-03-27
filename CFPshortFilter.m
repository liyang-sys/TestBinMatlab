function H=CFPshortFilter(N)
M=N/2; ctr=M+1;
H=[ones(1,M) zeros(1,M) 0]; 
if floor(M/2)==M/2 %M even
   Hctr=cos([1:M-1]/(2*M)*pi);   wc=M/2-1;
else %M odd
   Hctr=cos([0.5:M-0.5]/(2*M)*pi);   wc=floor(M/2);
end
H(ctr-wc:ctr+wc)=Hctr;
