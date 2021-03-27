%quantization step check on Gaussian distribution
%One partition: =================================================================
x=[5:-0.01:0];

m0L=0.5*(1-erf(x/sqrt(2)));
m1L=exp(-x.*x/2)/sqrt(2*pi);
m2L = x.*m1L +m0L;
DL = m2L - m1L.*m1L./m0L;
HL = -m0L.*log2(m0L);

m0R=0.5*(1+erf(x/sqrt(2)));
m1R=m1L;
m2R = -x.*m1R +m0R;
DR = m2R - m1R.*m1R./m0R;
HR = -m0R.*log2(m0R);

H=HL+HR; D=DL+DR;

%two partitions: =================================================================
x=[[5:-0.01:0.01] 0.00001];

m0=0.5*(1-erf(x/sqrt(2)));
m1=exp(-x.*x/2)/sqrt(2*pi);
m2 = x.*m1 +m0;
D2 = 2*(m2 - m1.*m1./m0);
H2 = -2*m0.*log2(m0);

m0c=1-2*m0;
m1c=0;
m2c = -2*x.*m1 +m0c;

D2 = D2 + (m2c - 0);
H2 = H2 - m0c.*log2(m0c);

figure; plot(H,10*log10(D)); hold on; plot(H2, 10*log10(D2), 'r'); grid; orient landscape

