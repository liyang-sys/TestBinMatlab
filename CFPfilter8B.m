function H=CFPfilter8B

N=16; ru2=sqrt(2); ru2i=1/ru2; hN=N/2;
ratio=[(1-1/4-1/32-1/256)^-1,  2,  2+1,  4+1-1/4,  8,  16-2 , 32]; %<=========== !!! improved!
%ratio=[1+1/4+1/8+1/32-1/128,  2,  2+1,  4+1-1/4,  8,  16-2 , 32]; %<=========== !!!

%ratio=fliplr([32+16     16        8         4+1-1/4  2+1+1/128 2+1/32+1/64  1+1/2-1/16-1/128]);
%ratio=fliplr([48.0000   16.0000    8.0000    4.7500    3.0105    2.0434    1.4312]);
%This one might has better compression performance at high rates

x=atan(1./ratio);
HR=[sqrt(2)/2 sin(x) 0];
HL=sqrt(1-fliplr(HR(2:hN+1)).^2);
H=[HL HR];

%figure; plot(H); hold on; plot(H,'r.')
