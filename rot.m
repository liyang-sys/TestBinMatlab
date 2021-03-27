function y=rot(x,theta,derivative)

a=cos(theta); b=sin(theta);

if derivative==0
   T=[a -b; b a]';
else %derivative==1
   T=[-b -a; a -b]';
end

y=T*x;
