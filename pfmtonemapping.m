function [ ldri ] = pfmtonemapping( hdr2ldr, double2int, h, w, isgry )
%此函数来实现pfm格式图像的色调映射
%   hdr2ldr是输入的TMO，double2int是浮点数转换后的整型HDR数据,这两个输入都应该是.dat后缀的二进制文件
%   isgry来判断是单通道还是三通道。

%%%读取HDR数据
hdri = read_doubletohalf( double2int, h, w, isgry );
%%%读取TMO
tmo=read_defaulttmoc(hdr2ldr);
%%%色调映射
if isgry==0
    d=3;
else
    d=1;
end
output=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            t=hdri(ii,jj,kk);
            v=tmo(t+1);
            output(ii,jj,kk)=v;
        end
    end
end
ldri=uint8(output);

end

