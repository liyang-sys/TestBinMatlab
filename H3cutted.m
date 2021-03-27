function m=H3cutted(lev0,level,n)

m=[n(:,2) n(:,1) n(:,3)];

maxn=max(max(n));
m1=m;
m2=[m1(:,1) m1(:,3) m1(:,2)];
m3=[m2(:,1) maxn-m2(:,2) maxn-m2(:,3)];

for lev=lev0+1:level
   p=2^(lev-1); q=2*p-1;
   tem2=[m1(:,1) m1(:,2) m1(:,3)+p];
   tem3=[m1(:,1) m1(:,2)+p m1(:,3)+p];
   tem4=[m3(:,1) m3(:,2)+p m3(:,3)];
   mm1=[m2; tem2; tem3; tem4];
   mm2=[mm1(:,1) mm1(:,3) mm1(:,2)];
   mm3=[mm2(:,1) q-mm2(:,2) q-mm2(:,3)];
   m1=mm1; m2=mm2; m3=mm3;
end

m=uint16(mm1);
clear m1 m2 m3 mm1 mm2 mm3 mmm1 mmm2 mmm3 mmmm1 tem2 tem3 tem4
%figure; plot3(m(:,1),m(:,2),m(:,3));axis([0 q 0 q 0 q]); axis off
