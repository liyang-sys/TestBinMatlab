function s=smooth(N,para,trans)
%Format: s=smooth(N,para)
%for 'extMeyer.m'


x=[0:N]/N; delta=1/N;

switch para
case '0'
   s=x;
case '1'
   t1=floor(N/2);
   x1=x(1:t1);
   s=2*x1.*x1;
   
   t11=ceil(N/2);
   if t11==t1
      t11=t11+1;
   end
   x2=x(t11:N+1);
   tmp=4*x2 -2*x2.*x2 -1;
   s=[s tmp];
case '1b'
   s=x.*x.*(3-2*x);
case '2'
   t1=floor(N/3)+1;
   x1=x(1:t1);
   s=4.5*x1.*x1.*x1;
   
   t11=ceil(N/3)+1;
   if t11==t1
      t11=t11+1;
   end
   t2=floor(2*N/3)+1;
   x2=x(t11:t2);
   tmp=-9*x2.*x2.*x2 +13.5*x2.*x2 -4.5*x2 +0.5;
   s=[s tmp];
   
   t22=ceil(2*N/3)+1;
   if t22==t2
      t22=t22+1;
   end
   x3=x(t22:N+1);
   tmp=4.5*x3.*x3.*x3 -13.5*x3.*x3 +13.5*x3 -3.5;
   s=[s tmp];
case '2a'
   n=trans;
   x0=1/(2*(n+1));
   k=0.5/Ypart2(0.5,n);
   
   t1=floor(x0/delta)+1;
   x1=x(1:t1);
   s=k*Ypart1(x1);
   
   t11=ceil(x0/delta)+1;
   if t11==t1
      t11=t11+1;
   end
   t2=floor((1-x0)/delta)+1;
   x2=x(t11:t2);
   tmp=k*Ypart2(x2,n);
   s=[s tmp];
   
   t22=ceil((1-x0)/delta)+1;
   if t22==t2
      t22=t22+1;
   end
   x3=x(t22:N+1);
   tmp=k*(-Ypart1(-x3+1)) +1;
   s=[s tmp];
case '2b'
   s=x.*x.*x.*(10 -15*x +6*x.*x);
case '3b'
   s=x.*x.*x.*x.* (35 -84*x +70*x.*x -20*x.*x.*x);
case '4b'
   s=x.^5.*(126 -420*x +540*x.*x -315*x.*x.*x +70*x.*x.*x.*x);
case '5b'
   s=x.^6.*(462 -1980*x +3465*x.*x -3080*x.*x.*x +1386*x.*x.*x.*x -252*x.^5);
end

