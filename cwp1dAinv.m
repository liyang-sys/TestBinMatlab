function a=cwp1dAinv(a,M)

[H,W]=size(a);

n=H/M; hM=M/2; n2=n*2; nL=n2*2;
L=cos(0.5*pi*smooth_simple(n2,'0'))';
L3=cos(0.5*pi*smooth_simple(nL,'3b'))';

tem=[1; L]; F=zeros(n2,W); tem3=[1; L3]; F3=zeros(nL,W); 
for ia=1:W,  F(:,ia)=tem; F3(:,ia)=tem3;  end
G=flipud(F);   G3=flipud(F3);

for m=1:M
   row = (m-1)*n+1 : m*n;
   a(row,:)=dct(a(row,:));
end

%second layer reconstruction (using F and G): ----------------------------
for m=1:2:M-1
   row = (m-1)*n+1 : (m+1)*n;
   a(row,:)=iLapProj(a(row,:),F,G);
end
%-------------------------------------------------------------------------

%first layer reconstruction (using F3 and G3): ---------------------------
for m=1:2:hM-1
   row = (m-1)*n2+1 : (m+1)*n2;
   a(row,:)=iLapProj(a(row,:),F3,G3);
end
for m=2:2:hM-1
   row = (m-1)*n2+1 : (m+1)*n2;
   a(row,:)=iLapProj(a(row,:),F3,G3);
end
%-------------------------------------------------------------------------

a=idct(a);
