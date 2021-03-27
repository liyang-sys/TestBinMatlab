function s=smooth_simple(N,para)
%for 'extMeyer.m'

x=(1:N-1)/N;

switch para
case '0'
   s=x;
case '1b'
   s=x.*x.*(3-2*x);
case '2b'
   s=x.*x.*x.*(10 -15*x +6*x.*x);
case '3b'
   s=x.*x.*x.*x.* (35 -84*x +70*x.*x -20*x.*x.*x);
case '4b'
   s=x.^5.*(126 -420*x +540*x.*x -315*x.*x.*x +70*x.*x.*x.*x);
case '5b'
   s=x.^6.*(462 -1980*x +3465*x.*x -3080*x.*x.*x +1386*x.*x.*x.*x -252*x.^5);
end
