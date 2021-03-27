function b=block2bd(a,M,Lev,tanTheta)

N=size(a);  w=floor(N/M);  md=N-M*w; 

b=zeros(N);
%for rows:  ----------------------------------------------------------------------
n=N(1); m=md(1); ww=w(1);
b((M-m)*ww+1:(ww+1):n,:)=a(1:m,:);
p=zeros(1,M);  p(M-m+1:M)=p(M-m+1:M)+[1:m];
for ia=1:M
   b((ia-1)*ww+1+p(ia):ia*ww+p(ia),:)=a(ia+m:M:n,:);
end

%for columns:  -------------------------------------------------------------------
a=b;
n=N(2); m=md(2); ww=w(2);
b(:,(M-m)*ww+1:(ww+1):n)=a(:,1:m);
p=zeros(1,M);  p(M-m+1:M)=p(M-m+1:M)+[1:m];
for ia=1:M
   b(:,(ia-1)*ww+1+p(ia):ia*ww+p(ia))=a(:,ia+m:M:n);
end
%xxx=b;

%---------------------------------------------------------------------
H=zeros(1,Lev); W=H;
H(1)=w(1); W(1)=w(2);
for ia=1:Lev-1
   H(ia+1)=ceil(H(ia)/2);   W(ia+1)=ceil(W(ia)/2);
end
for ia=1:Lev
   b(1:H(ia),1:W(ia))=CFP2bd(b(1:H(ia),1:W(ia)),tanTheta);
   b(1:H(ia),1:W(ia))=block2LowHigh(b(1:H(ia),1:W(ia)));
end
