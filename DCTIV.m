function X=DCTIV(x)

N=length(x); Nd=N-1;

X=zeros(size(x));
a=pi/N;
for k=0:Nd
   X(k+1)=sum(x.*cos(a*(k+0.5)*([0:Nd]'+0.5)));
end
X=sqrt(2/N)*X;
