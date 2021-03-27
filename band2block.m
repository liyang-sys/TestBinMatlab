function b=band2block(a,M,tanTheta)

N=size(a);  w=floor(N/M);  md=N-M*w; 

b=a;
nbk=w; hbk=nbk/2; qbk=nbk/4;


%b(1:qbk(1),1:qbk(2))=LowHigh2block(b(1:qbk(1),1:qbk(2)));
%b(1:qbk(1),1:qbk(2))=LFP2inv(b(1:qbk(1),1:qbk(2)),2,fL);
%b(1:hbk(1),1:hbk(2))=LowHigh2block(b(1:hbk(1),1:hbk(2)));
%b(1:hbk(1),1:hbk(2))=LFP2inv(b(1:hbk(1),1:hbk(2)),2,fL);
%b(1:nbk(1),1:nbk(2))=LowHigh2block(b(1:nbk(1),1:nbk(2)));
%b(1:nbk(1),1:nbk(2))=LFP2inv(b(1:nbk(1),1:nbk(2)),2,fL);


%tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8;




%b=a;
%reconstruction of the DC band:  ----------------------
%b(1:qbk(1),1:qbk(2))=ib44int(a(1:hq(1),1:hq(2)),a(1:hq(1),hq(2)+1:qbk(2)),...
 %  a(hq(1)+1:qbk(1),1:hq(2)),a(hq(1)+1:qbk(1),hq(2)+1:qbk(2)));
%b(1:hbk(1),1:hbk(2))=ib44int(b(1:qbk(1),1:qbk(2)), b(1:qbk(1),qbk(2)+1:hbk(2)),...
 %  b(qbk(1)+1:hbk(1),1:qbk(2)), b(qbk(1)+1:hbk(1),qbk(2)+1:hbk(2)));
%b(1:nbk(1),1:nbk(2))=ib44int(b(1:hbk(1),1:hbk(2)), b(1:hbk(1),hbk(2)+1:nbk(2)),...
 %  b(hbk(1)+1:nbk(1),1:hbk(2)), b(hbk(1)+1:nbk(1),hbk(2)+1:nbk(2)));

%-----------------------------------------------------------------------------
%b(1:qbk(1),1:qbk(2))=iHarr2(b(1:qbk(1),1:qbk(2)));
%b(1:hbk(1),1:hbk(2))=iHarr2(b(1:hbk(1),1:hbk(2)));
%b(1:nbk(1),1:nbk(2))=iHarr2(b(1:nbk(1),1:nbk(2)));

%-----------------------------------------------------------------------------
b(1:qbk(1),1:qbk(2))=LowHigh2block(b(1:qbk(1),1:qbk(2)));
b(1:qbk(1),1:qbk(2))=CFP2bandInv(b(1:qbk(1),1:qbk(2)),tanTheta);
b(1:hbk(1),1:hbk(2))=LowHigh2block(b(1:hbk(1),1:hbk(2)));
b(1:hbk(1),1:hbk(2))=CFP2bandInv(b(1:hbk(1),1:hbk(2)),tanTheta);
b(1:nbk(1),1:nbk(2))=LowHigh2block(b(1:nbk(1),1:nbk(2)));
b(1:nbk(1),1:nbk(2))=CFP2bandInv(b(1:nbk(1),1:nbk(2)),tanTheta);




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
