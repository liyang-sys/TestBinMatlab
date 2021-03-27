function sb=scanHilbert2D(sub)

[H,W]=size(sub);
[r,c]=modify_Hilbert2D(H,W);

len=numel(sub); sb=zeros(1,len);
for ia=1:len
   sb(ia)=sub(r(ia),c(ia));
end
