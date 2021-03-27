clc;

fid1=fopen('E:\程序代码\色调映射测试\测试数据\ldr2hdr.dat','r');
ldrtohdr=fread(fid1,'uint16');
ldrtohdr=ldrtohdr';
fclose(fid1);

ml=Linearization(ldrtohdr);
mh=0:32767;
f=0.5;
m=f*mh+(1-f)*ml;

idx=ldrtohdr(2)+1;
x1=0;y1=0;
x2=m(idx); y2=ml(idx);
ii=1;jj=2;

tmo=zeros(1,32768);
while 1
    if ii<=x2
       y=((y2-y1)*(ii-1)+y1*x2-y2*x1)/(x2-x1);
       tmo(ii)=y;
       ii=ii+1;
    else
       x1=x2;y1=y2;
       jj=jj+1;
       if jj>256
           break;
       end
       idx=ldrtohdr(jj)+1;
       x2=m(idx);y2=ml(idx);
    end
end

if ii<32768
   tmo(ii:32768)=255; 
end

mml=zeros(1,32768);
for ia=1:32768
   x=m(ia);
   a1=floor(x)+1; b1=tmo(a1);
   a2=a1+1; b2=tmo(a2);
   y0=(b2-b1)*(x+1)+b1*a2-b2*a1;
   mml(ia)=y0;
end

