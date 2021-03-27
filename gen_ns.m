%n87 ==========================================================================================
load H3L3
n=int32(double(n)); 
tem=n'+1; n=tem; n(1,:)=tem(2,:);  n(2,:)=tem(1,:); n(3,:)=tem(3,:);
n8=n;
n87=reduce_1_in3D(n8,7);
len=length(n87); x=n87(:,1:len-1)-n87(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]


%n84 and n83 ===================================================================================
load H3L2
n=int32(double(n)); n0=n;
n(:,1)=n0(:,1); n(:,3)=n0(:,2);  n(:,2,:)=n0(:,3);
n=int32(H3cutted(2,3,n)'+1); 
tem=n;  n(2,:)=tem(2,:); n(1,:)=tem(3,:);  n(3,:)=tem(1,:);

n84=n;
len=length(n84); x=n84(:,1:len-1)-n84(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]

n83=reduce_1_in3D(n84,3);
len=length(n83); x=n83(:,1:len-1)-n83(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]


%n82 and n81 ===================================================================================
load H3L1
n=int32(H3cutted(1,3,n)'+1); 
tem=n;  n(2,:)=tem(2,:); n(1,:)=tem(3,:);  n(3,:)=tem(1,:);
n82=n;
len=length(n82); x=n82(:,1:len-1)-n82(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]

n81=reduce_1_in3D(n82,1);
len=length(n81); x=n81(:,1:len-1)-n81(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]


%n42, n41 and n43 ===================================================================================
load H3L1
n=int32(H3cutted(1,2,n)'+1); 
tem=n;  n(2,:)=tem(2,:); n(1,:)=tem(3,:);  n(3,:)=tem(1,:);

n42=n; 
n41=reduce_1_in3D(n42,1);

load H3L2
n=int32(double(n)); 
tem=n'+1; n=tem; n(1,:)=tem(2,:);  n(2,:)=tem(1,:); n(3,:)=tem(3,:);
n4=n;
n43=reduce_1_in3D(n4,3);
len=length(n43); x=n43(:,1:len-1)-n43(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]

%n86 and n85 ===================================================================================
n=n8; n(1,:)=n8(3,:); n(3,:)=n8(1,:);
p1=n(:,1:128); p2=n(:,385:512);
nn=n42; nn(3,:)=n42(3,:)+4;
p3=nn; p3(1,:)=p3(1,:)+4;
p4=nn; p4(1,:)=5-nn(2,:); p4(2,:)=5-nn(1,:);
p5=nn; p5(1,:)=nn(2,:); p5(2,:)=nn(1,:)+4;
p6=p3; p6(2,:)=p6(2,:)+4;
n86=[p1 p3 p4 p5 p6 p2];
len=length(n86); x=n86(:,1:len-1)-n86(:,2:len); x=sum(abs(x)); maxmin86=[max(x) min(x)]

n85=reduce_1_in3D(n86,5);
len=length(n85); x=n85(:,1:len-1)-n85(:,2:len); x=sum(abs(x)); maxmin=[max(x) min(x)]


%n2 and n21 ===================================================================================
load H3L1
n=int32(double(n)); 
tem=n'+1; n=tem; n(1,:)=tem(2,:);  n(2,:)=tem(1,:); n(3,:)=tem(3,:);
n2=n;
n21=reduce_1_in3D(n2,1);

%save n3D n2 n21 n4 n41 n42 n43 n8 n81 n82 n83 n84 n85 n86 n87
