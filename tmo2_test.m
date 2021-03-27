clc;

f=0.5; tohdr=0;
fid1=fopen('E:\程序代码\色调映射测试\测试数据\ldr2hdr.dat','r');
ldrtohdr=fread(fid1,'uint16');
ldrtohdr=ldrtohdr';
fclose(fid1);

ml=Linearization(ldrtohdr);
mh=0:32767;
mh=mh/32767*255;
m=f*mh+(1-f)*ml;

fid=fopen('E:\程序代码\色调映射测试\测试数据\DoubleToHalf.dat','r');
hdr0=fread(fid,'uint16');
hdr0=reshape(hdr0,512,768);
hdr0=hdr0';
fclose(fid);

[h,w,d]=size(hdr0);
redata=zeros(h,w,d);
ldr0=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            t=hdr0(ii,jj,kk);
            v1=m(t+1);
            redata(ii,jj,kk)=v1;
            v2=ml(t+1);
            ldr0(ii,jj,kk)=v2;
        end
    end
end

hdr=tmo2(redata,'E:\程序代码\色调映射测试\测试数据\ldr2hdr.dat',1,0.5);
% [img2hdr, MAX]=Linearization3(m);
% img2ldr=Linearization4(ldrtohdr, m, ml);
% 
% [h,w,d]=size(redata);
% if tohdr == 0   %%恢复ldr图像
%     ldr=zeros(h,w,d);
%     for ii=1:h
%         for jj=1:w
%             for kk=1:d
%                   x=redata(ii,jj,kk);
%                   a1=floor(x)+1; b1=img2ldr(a1);
%                   a2=a1+1; b2=img2ldr(a2);
%                   y0=(b2-b1)*(x+1)+b1*a2-b2*a1;
%                   ldr(ii,jj,kk)=y0;
%             end
%         end
%     end
% else                %%恢复hdr图像
%    hdr=zeros(h,w,d);
%    for ii=1:h
%        for jj=1:w
%            for kk=1:d
%                t=redata(ii,jj,kk);
%                v=img2hdr(round((t*32767)/MAX)+1);
%                hdr(ii,jj,kk)=v;
%            end
%        end
%    end
% end

