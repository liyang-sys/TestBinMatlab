function h=H(p)
%Find the entropy

q=1-p;
h=-(p*log2(p)+q*log2(q));
