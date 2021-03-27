function p=prob_est(n)

if length(n)<=3
   p=1-n(2)/n(1);   
else
   % 2*nt-term estimation (power to the (1/nt) ):
   if length(n)>=16
      nt=4;
   else
      nt=2;
   end
   a=sum(n(1:nt));  b=sum( n(nt+1 : 2*nt) ); 
   if b>a,   c=b; b=a; a=c;   end %<=== added 24/06/13
      
   dx=(a-b)/a;

   %p=dx/nt; 
   p= dx/nt  +(1/(2*nt))*(1-1/nt)*(dx*dx); 
end

