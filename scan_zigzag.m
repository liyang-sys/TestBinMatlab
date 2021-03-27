function b=scan_zigzag(a,hh)

[H,W]=size(a);

N=numel(a);    b=zeros(1,N);
k=floor((W-1)/2);    w=2*k+1;
n=hh*w;

if w<W
   aa=a(:,2:W);
else
   aa=a(:,1:w);
end

h=hh; t=1; pt=1;
while h<H
   tem=aa(h-hh+1:h, :);
   if t/2-floor(t/2) <0.1,   tem = fliplr(tem);   end
   
   tem(:,2:2:w)=flipud(tem(:,2:2:w));
   b(pt:pt+n-1)=reshape(tem,1,n);  pt=pt+n;
   h=h+hh; t=t+1;
end

if h-hh+1<H  
   tem=aa(h-hh+1:H, :);
   if t/2-floor(t/2) <0.1,   tem = fliplr(tem);   end

   tem(:,2:2:w)=flipud(tem(:,2:2:w));
   nn=numel(tem);   b(pt:pt+nn-1)=reshape(tem,1,nn);  pt=pt+nn;
end

if w<W,   b(pt:N)=flipud(a(:,1))';   end
