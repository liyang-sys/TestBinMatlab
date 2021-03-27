function a=Pre2p_DCT4p(a)

[h,w]=size(a);

for ia=3:4:h-2
   a(ia:ia+3,:)=prefilter_2point(a(ia:ia+3,:));
end
for ia=1:4:h
   a(ia:ia+3,:)=dct(a(ia:ia+3,:));
end

a=a';
for ia=3:4:w-2
   a(ia:ia+3,:)=prefilter_2point(a(ia:ia+3,:));
end
for ia=1:4:w
   a(ia:ia+3,:)=dct(a(ia:ia+3,:));
end

a=a';
