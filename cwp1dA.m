function coef=cwp1dA(a,M)

[H,W]=size(a);  n=H/M; hM=M/2;
if n<2
   fprintf('\n >>>>>> Input signal length is too short. It must longer than 2M. <<<<<<<\n\n');
   coef=0; return;
end
if round(n)~=n
   fprintf('\n >>>>>> Input signal length must be multiples of M. <<<<<<<\n\n');
end

%--------------------------------------------------------------------------
coef=dct(a);

n2=n*2; nL=n2*2;
L=cos(0.5*pi*smooth_simple(n2,'0'))';
L3=cos(0.5*pi*smooth_simple(nL,'3b'))';
%figure; plot(L,'.-'); hold on; plot(L3,'.-');

tem=[1; L]; F=zeros(n2,W); tem3=[1; L3]; F3=zeros(nL,W); 
for ia=1:W,  F(:,ia)=tem; F3(:,ia)=tem3;  end
G=flipud(F);   G3=flipud(F3);

%first layer decomposition (using F3 and G3): -----------------------------
for m=2:2:hM-1
   row = (m-1)*n2+1 : (m+1)*n2;
   coef(row,:)=LapProj(coef(row,:),F3,G3);
end
for m=1:2:hM-1
   row = (m-1)*n2+1 : (m+1)*n2;
   coef(row,:)=LapProj(coef(row,:),F3,G3);
end
%--------------------------------------------------------------------------

%second layer decomposition (using F and G): ------------------------------
for m=1:2:M-1
   row = (m-1)*n+1 : (m+1)*n;
   coef(row,:)=LapProj(coef(row,:),F,G);
end
%-------------------------------------------------------------------------

for m=1:M
   row = (m-1)*n+1 : m*n;
   coef(row,:)=idct(coef(row,:));
end
