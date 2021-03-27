load H2

hn=cell(6,1);
%=====================================================
k=routxy;

m=routxy3;
m(1,:)=routxy3(2,:); m(2,:)=routxy3(1,:)+256;
%figure; plot(m(1,:),m(2,:))

n3=[k m];
%figure; plot(n3(1,:),n3(2,:))
m(1,:)=m(1,:)+64;
n3=[n3 m];
%figure; plot(n3(1,:),n3(2,:))
m(1,:)=m(1,:)+64;
n3=[n3 m];
%figure; plot(n3(1,:),n3(2,:))
m(1,:)=m(1,:)+64;
n3=[n3 m];
%figure; plot(n3(1,:),n3(2,:)); axis equal; axis off;
hn{3}=n3;

max(max(abs(double(n3(:,2:length(n3)))-double(n3(:,1:length(n3)-1)))))

%=====================================================
k=routxy2;

m=routxy4;
m(1,:)=routxy4(2,:); m(2,:)=routxy4(1,:)+256/2;

n4=[k m];
m(1,:)=m(1,:)+64/2;
n4=[n4 m];
m(1,:)=m(1,:)+64/2;
n4=[n4 m];
m(1,:)=m(1,:)+64/2;
n4=[n4 m];
%figure; plot(n4(1,:),n4(2,:)); axis equal; axis off;
hn{4}=n4;

max(max(abs(double(n4(:,2:length(n4)))-double(n4(:,1:length(n4)-1)))))


%=====================================================
k=routxy3;

m=routxy5;
m(1,:)=routxy5(2,:); m(2,:)=routxy5(1,:)+256/4;

n5=[k m];
m(1,:)=m(1,:)+64/4;
n5=[n5 m];
m(1,:)=m(1,:)+64/4;
n5=[n5 m];
m(1,:)=m(1,:)+64/4;
n5=[n5 m];
%figure; plot(n5(1,:),n5(2,:)); axis equal; axis off;
hn{5}=n5;

max(max(abs(double(n5(:,2:length(n5)))-double(n5(:,1:length(n5)-1)))))


%=====================================================
k=routxy4;

m=routxy6;
m(1,:)=routxy6(2,:); m(2,:)=routxy6(1,:)+256/8;

n6=[k m];
m(1,:)=m(1,:)+64/8;
n6=[n6 m];
m(1,:)=m(1,:)+64/8;
n6=[n6 m];
m(1,:)=m(1,:)+64/8;
n6=[n6 m];
%figure; plot(n6(1,:),n6(2,:)); axis equal; axis off;
hn{6}=n6;

max(max(abs(double(n6(:,2:length(n6)))-double(n6(:,1:length(n6)-1)))))


%=====================================================
load H2ext

k=[yy; xx];

m=routxy2;
m(1,:)=routxy2(2,:); m(2,:)=routxy2(1,:)+256*2;
n2=[k m];

m(1,:)=m(1,:)+64*2;
n2=[n2 m];
m(1,:)=m(1,:)+64*2;
n2=[n2 m];
m(1,:)=m(1,:)+64*2;
n2=[n2 m];
hn{2}=n2;
figure; plot(n2(1,:),n2(2,:)); axis equal; axis off;



n = [n2  fliplr([1025-n2(1,:); n2(2,:)]) ];
na = fliplr([n(1,:); 641-n(2,:)]);
nb =[n(1,:); n(2,:)+640];
n1=[na nb];
figure; plot(n1(1,:),n1(2,:)); axis equal; %axis off;
hn{1}=n1;

max(max(abs(double(n1(:,2:length(n1)))-double(n1(:,1:length(n1)-1)))))

%save 'H2_5x4' hn
