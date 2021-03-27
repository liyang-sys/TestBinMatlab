function a=Pre2p_DCT4p(a)

[h,w]=size(a);

a0=a;
for ia=3:4:h-2
   a(ia:ia+3,:)=prefilter_2point(a(ia:ia+3,:));
end
a(1:4,:)=dct(a0(1:4,:));  a(end-3:end,:)=dct(a0(end-3:end,:));
for ia=5:4:h-4
   a(ia:ia+3,:)=dct(a(ia:ia+3,:));
end

a=a'; a0=a;
for ia=3:4:w-2
   a(ia:ia+3,:)=prefilter_2point(a(ia:ia+3,:));
end
a(1:4,:)=dct(a0(1:4,:));  a(end-3:end,:)=dct(a0(end-3:end,:));
for ia=5:4:w-4
%for ia=1:4:w
   a(ia:ia+3,:)=dct(a(ia:ia+3,:));
end

a=a';
