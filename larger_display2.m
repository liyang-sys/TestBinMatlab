function larger_display2(A,mag)

A=double(A);
[H,W]=size(A);

B=zeros(mag*H,W);
for ia=1:mag
   B(ia:mag:mag*H,:)=A;
end

C=zeros(mag*H,mag*W);
for ia=1:mag
   C(:,ia:mag:mag*W)=B;
end

%figure; imshow(C/max(max(C)))
figure; imshow(C)
