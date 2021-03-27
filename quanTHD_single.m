function qA=quanTHD(A,T,delta)
%Format: [qAchar,den,ctt,ctr,qA]=quanTHD(delta,T,A)
%To quantize a subband. 'THD' means variable threshold

A=single(A);
snA=sign(A);

offset=single(T-delta/2);
ps_qA=round((abs(A)-offset)/delta);

sn1=sign(ps_qA);
sn=sign(snA.*(sn1+1));  %<=========eleminating negative coeffs from dead zone

qA=ps_qA.*sn;
%qA=int16(qA);
