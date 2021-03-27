function [coef,H0,h0,H1,h1]=SWP2modified(a,M)

%M=8; %only 8 bands condition is considered here

N=size(a);
m=N/128;
%if sum(abs(round(m)-m))>1e-8
 %  fprintf('\n\nInput dimension is restricted to be k*128 (k is integer)!!!\n\n');
  % coef=0; return;
%end

coef=dct2(a);

hN=N/2;  w=floor(N/M); wH=2*w; w1=floor(0.8*w); wH1=2*w1; 

L=ftr4directDecom(wH(1),0,'Gauss',1.75); %for 1.09
L1=ftr4directDecom(wH1(1),0,'Gauss',1.75); %for 1.09
tem=[1; L];   tem1=[1; L1];
H=zeros(wH(1),N(2));   H1=zeros(wH1(1),N(2));
for ia=1:N(2),  H(:,ia)=tem;  H1(:,ia)=tem1;  end
G=flipud(H);  H0=H; G1=flipud(H1);

for p=wH(1)+1:wH(1):N(1)
   row=[p-w(1):p+w(1)-1];
   coef(row,:)=LapProj(coef(row,:),H,G);
end
p=w(1)+1;
row=[p-w1(1):p+w1(1)-1]; col=[1:N(2)/4];
coef(row,col)=LapProj(coef(row,col),H1(:,col),G1(:,col));
row=[p-w1(1):p+w1(1)-1]; col=[N(2)/4+1:N(2)];
coef(row,col)=LapProj(coef(row,col),H1(:,col),G1(:,col));
for p=w(1)+1+wH(1):wH(1):N(1)
   row=[p-w(1):p+w(1)-1]; 
   coef(row,:)=LapProj(coef(row,:),H,G);
end   

%-------------------------------------------------------------------------
L=ftr4directDecom(wH(2),0,'Gauss',1.75); %for 1.09
L1=ftr4directDecom(wH1(2),0,'Gauss',1.75); %for 1.09
tem=[1; L];   tem1=[1; L1];
h=zeros(wH(2),N(1));   h1=zeros(wH1(2),N(1));  
for ia=1:N(1),  h(:,ia)=tem;  h1(:,ia)=tem1;  end
g=flipud(h);  h0=h; g1=flipud(h1);

coef=coef';
for p=wH(2)+1:wH(2):N(2)
   row=[p-w(2):p+w(2)-1]; 
   coef(row,:)=LapProj(coef(row,:),h,g);
end
p=w(2)+1;
row=[p-w1(2):p+w1(2)-1]; col=[1:N(1)/4];
coef(row,col)=LapProj(coef(row,col),h1(:,col),g1(:,col));
row=[p-w1(2):p+w1(2)-1]; col=[N(1)/4+1:N(1)];
coef(row,col)=LapProj(coef(row,col),h1(:,col),g1(:,col));
for p=w(2)+wH(2)+1:wH(2):N(2)
   row=[p-w(2):p+w(2)-1];
   coef(row,:)=LapProj(coef(row,:),h,g);
end   

%-------------------------------------------------------------------------
coef(1:w(2), w(1)+1:N(1)) = idct(coef(1:w(2),w(1)+1:N(1)));
for p=w(2)+1:w(2):N(2),  coef(p:p+w(2)-1,:)=idct(coef(p:p+w(2)-1,:));  end
coef=coef'; 
coef(1:w(1), w(2)+1:N(2)) = idct(coef(1:w(1),w(2)+1:N(2)));
for p=w(1)+1:w(1):N(1),  coef(p:p+w(1)-1,:)=idct(coef(p:p+w(1)-1,:));  end



%-------------------------------------------------------------------------
w0=w;
L=6-log2(M); %use 6-level decomposition
%L=0, coef(1:w(1),1:w(2))=idct2(coef(1:w(1),1:w(2))); %<==================

for m=1:L
   w=w0/2^m; wH=2*w;
   coef1=coef(1:wH(1),1:wH(2));
   H=downsamp(H); G=flipud(H);
   coef1=LapProj(coef1,H(:,1:wH(2)),G(:,1:wH(2)));
   h=downsamp(h); g=flipud(h);
   coef1=LapProj(coef1',h(:,1:wH(1)),g(:,1:wH(1)));
   coef1(1:w(2),w(1)+1:wH(1))=idct2(coef1(1:w(2),w(1)+1:wH(1)));
   coef1(w(2)+1:wH(2),1:w(1))=idct2(coef1(w(2)+1:wH(2),1:w(1)));
   coef1(w(2)+1:wH(2),w(1)+1:wH(1))=idct2(coef1(w(2)+1:wH(2),w(1)+1:wH(1)));
   coef(1:wH(1),1:wH(2))=coef1';
end
