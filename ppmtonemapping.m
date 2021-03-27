function [ ldri ] = ppmtonemapping( infilename, hdr2ldr)
%此函数用来将PPM格式图像根据输入的hdrtoldr映射到低动态范围
%   infilename输入的PPM文件，hdr2ldr是一个.dat后缀的二进制文件，保存的是一个映射表

%读取HDR数据
[ hdri, h, w, d, ~, ~ ] = ppmread_gry( infilename );
%读取TMO
tmo=read_defaulttmoc(hdr2ldr);
%色调映射
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

