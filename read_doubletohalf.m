function [ A ] = read_doubletohalf( infilename, h, w, isgry )
%此函数用来读取浮点数通过DoubleToHalf转换得到的整型数据
%   infilename应该是.dat后缀的二进制文件；h，w分别是图像的高和宽
%   isgry表示图像是彩色图像还是灰度图像，isgry=0表示是彩色图像。
fid=fopen(infilename,'r');

if isgry==0
    A=uint16(zeros(h,w,3));
    hdr=fread(fid,[1,w*h*3],'uint16');
    hdr=reshape(hdr,[3,w*h]);
    A(:,:,1)=reshape(hdr(1,:),[w,h])';
    A(:,:,2)=reshape(hdr(2,:),[w,h])';
    A(:,:,3)=reshape(hdr(3,:),[w,h])';
else
    hdr=fread(fid,'uint16');
    hdr=reshape(hdr,w,h);
    A=hdr';
end
fclose(fid);

end

