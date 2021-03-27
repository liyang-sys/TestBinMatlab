function b=block2band0(a,M,tanTheta)

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

%---------------------------------------------------------------------
%nbk=w; hbk=nbk/2; qbk=nbk/4;
%b(1:nbk(1),1:nbk(2))=CFP2band(b(1:nbk(1),1:nbk(2)),tanTheta);
%b(1:nbk(1),1:nbk(2))=block2LowHigh(b(1:nbk(1),1:nbk(2)));
%b(1:hbk(1),1:hbk(2))=CFP2band(b(1:hbk(1),1:hbk(2)),tanTheta);
%b(1:hbk(1),1:hbk(2))=block2LowHigh(b(1:hbk(1),1:hbk(2)));
%b(1:qbk(1),1:qbk(2))=CFP2band(b(1:qbk(1),1:qbk(2)),tanTheta);
%b(1:qbk(1),1:qbk(2))=block2LowHigh(b(1:qbk(1),1:qbk(2)));
