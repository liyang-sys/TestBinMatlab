function b=band2block_only(a,M)

N=size(a);  w=floor(N/M);  md=N-M*w; 

b=a;
nbk=w; hbk=nbk/2; qbk=nbk/4;


a=b;
%for rows:  ----------------------------------------------------------------------
n=N(1); m=md(1); ww=w(1);
b(1:m,:)=a((M-m)*ww+1:(ww+1):n,:);
p=zeros(1,M);  p(M-m+1:M)=p(M-m+1:M)+[1:m];
for ia=1:M
   b(ia+m:M:n,:)=a((ia-1)*ww+1+p(ia):ia*ww+p(ia),:);
end

%for columns:  -------------------------------------------------------------------
a=b;
n=N(2); m=md(2); ww=w(2);
b(:,1:m)=a(:,(M-m)*ww+1:(ww+1):n);
p=zeros(1,M);  p(M-m+1:M)=p(M-m+1:M)+[1:m];
for ia=1:M
   b(:,ia+m:M:n)=a(:,(ia-1)*ww+1+p(ia):ia*ww+p(ia));
end
