function a=pre3_ext_inv(a)

S=[4/3  8/7  8/7  8/7]';   P=[-3/8  -1/4  -1/16]';   U=[3/4  1/2  1/4]';
[H,W]=size(a);

a=dctMinv(a',8);
for ia=5:8:W-8
   a(ia:ia+7,:)=prefilter3inv(a(ia:ia+7,:),S,P,U);
end
a=a';
for ia=5:8:H-8
   a(ia:ia+7,:)=prefilter3inv(a(ia:ia+7,:),S,P,U);
end
