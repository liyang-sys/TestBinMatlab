%H=20/4; W=28/4;

%H=17;W=30;
%H=9;W=24;
%H=41;W=24;
%H=48; W=81;
%H=13*2;W=15*2;
%H=41; W=44;
%H=103; W=108; %W: 105 to 108
%H=248; W=253;
H=248; W=248;
%H=256; W=256;
%H=191; W=125; %<===   k0=2
%H=31, W=31

H=135; W=240;

%H=135*4; W=240*4;
%H=202/2; W=360/4;
%H=50; W=360/4;
%H=1219, W=3001;

H,W,k0=3
m=modify_Hilbert3D(H,W,k0);
figure; plot3(m(1,:),m(2,:),m(3,:)); axis off; axis equal
%len=length(m); x=m(:,1:len-1)-m(:,2:len); x=sum(abs(x));  maxmin=[max(x) min(x)], len-H*W*2^k0

%[val,ix]=max(x)

%[r0,c0]=modify_Hilbert2D(H,W);
%figure; plot(c0,r0); axis off; axis equal
