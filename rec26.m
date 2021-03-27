function a=rec26(lo,hi)

le=size(lo,1);
lo=[lo(1,:); lo; lo(le,:)];
hi=[-hi(1,:); hi; -hi(le,:)];

hlen=le+2; len=2*hlen;

sz=size(lo);
low1=zeros(sz);  low1(:,:,1)=lo; low1(:,:,2)=lo;
low1=shiftdim(low1,2);
low1=reshape(low1,len,sz(2));

low2=zeros(sz);  low2(:,:,1)=lo; low2(:,:,2)=-lo;
low2=shiftdim(low2,2);
low2=reshape(low2,len,sz(2))/8;

low=low2(1:len-4,:) +low1(3:len-2,:) -low2(5:len,:);

%---------------------------------------------------------
high=zeros(sz);  high(:,:,1)=hi; high(:,:,2)=-hi;
high=shiftdim(high,2);
high=reshape(high,len,sz(2));

a=(low + high(3:len-2,:))/sqrt(2);
