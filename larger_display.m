function larger_display(A)

A=double(A);
[H,W]=size(A);

B=zeros(4*H,W);
B(1:4:4*H,:)=A; B(2:4:4*H,:)=A; B(3:4:4*H,:)=A; B(4:4:4*H,:)=A;
C=zeros(4*H,4*W);
C(:,1:4:4*W)=B; C(:,2:4:4*W)=B; C(:,3:4:4*W)=B; C(:,4:4:4*W)=B; 

%figure; imshow(C/max(max(C)))
figure; imshow(C)
