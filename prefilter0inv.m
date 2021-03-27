function y=prefilter0inv(x,thetaM,s)

sz=size(x);
if sz(2)>1, x=x'; end
N=length(x); hN=N/2; hNu=hN+1;

y=zeros(N,1);
y(1:hN)=x(1:hN)+flipud(x(hNu:N));
y(hNu:N)=flipud(x(1:hN))-x(hNu:N);

%y(hNu:N)=flipud(DCTIV(dct(flipud( y(hNu:N) ))));
theta=thetaM(hN-1,1:hN-1);  z=flip(y(hNu:N));  for ia=hN-1:-1:1, z(ia:ia+1)=rot(z(ia:ia+1),-theta(ia),0); end;  y(hNu:N)=flip(z)/s;

x=y;
y(1:hN)=x(1:hN)+flipud(x(hNu:N));
y(hNu:N)=flipud(x(1:hN))-x(hNu:N);

y=y/2;