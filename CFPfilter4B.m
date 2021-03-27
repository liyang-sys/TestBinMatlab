function H=CFPfilter4B

%ratio=[(1/2+1/64)^-1 4+1/8 8+4]; N=8;
ratio=[(1/2+1/64)^-1 4 8+4]; N=8; % <===============
%ratio=[2 4+1/4 16-2]; N=8;
%ratio=[2 4 16-2]; N=8;
ru2=sqrt(2); ru2i=1/ru2; hN=N/2;

x=atan(1./ratio);
HR=[sqrt(2)/2 sin(x) 0];
HL=sqrt(1-fliplr(HR(2:hN+1)).^2);
H=[HL HR];

%figure; plot(H); hold on; plot(H,'r.')
