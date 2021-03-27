function y=prefilter0(x,thetaM,s)

sz=size(x);
if sz(2)>1, x=x'; end
N=length(x); hN=N/2; hNu=hN+1;

y=zeros(N,1);
y(1:hN)=x(1:hN)+flipud(x(hNu:N));
y(hNu:N)=flipud(x(1:hN))-x(hNu:N);

%y(hNu:N)=flipud(idct(DCTIV(flipud( y(hNu:N) ))));
theta=thetaM(hN-1,1:hN-1);  z=flip(y(hNu:N))*s;  for ia=1:hN-1, z(ia:ia+1)=rot(z(ia:ia+1),theta(ia),0); end;  y(hNu:N)=flip(z);

x=y;
y(1:hN)=x(1:hN)+flipud(x(hNu:N));
y(hNu:N)=flipud(x(1:hN))-x(hNu:N);

y=y/2;