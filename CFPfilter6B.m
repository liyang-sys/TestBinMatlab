function H=CFPfilter6B

N=12; ru2=sqrt(2); ru2i=1/ru2; hN=N/2;

%ratio=[1+1/2+1/16  (1/2-1/8+1/32)^-1  4+1/4  8  16+4+2]; %closest to the original 
%ratio=fliplr([22.0000    8.0000    4.2500    2.4596    1.5635]);
ratio=[1+1/2+1/16 (1/4+1/8+1/32)^-1  4+1/4 8  (1/32+1/64-1/1024)^-1]; %closest to the original, more precise 
%ratio=fliplr([21.8597    8.0177    4.2500    2.4615    1.5625]);

%ratio=[(1/2+1/8+1/128)^-1 (1/4+1/8+1/64)^-1  4+1/2  8+1  16+8+1/2]; %<== a narrower one


%ratio=[(1/2+1/8+1/128+1/1024)^-1  (1/2-1/8+1/64)^-1  4+1/2  8+1  16+8];
%ratio=fliplr([24.0000    9.0000    4.5000    2.5596    1.5766]);

%ratio=[(1/2+1/8+1/128+1/1024)^-1   (1/2-1/16-1/32)^-1   4+1/4  8  16+8];
%ratio=fliplr([24.0000    8.0000    4.2500    2.4596    1.5766]);

x=atan(1./ratio);
HR=[sqrt(2)/2 sin(x) 0];
HL=sqrt(1-fliplr(HR(2:hN+1)).^2);
H=[HL HR];

%figure; plot(H); hold on; plot(H,'r.')
