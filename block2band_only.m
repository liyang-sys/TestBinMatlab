function b=block2band_only(a,M)

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
