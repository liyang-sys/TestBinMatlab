function [ tmo ] = read_defaulttmoc( infilename )
% 主要用来读取通过Defaulttmoc生成的hdr2ldr.dat或者ldr2hdr.dat文件
%   infilename必须是.dat后缀的二进制文件，

fid=fopen(infilename,'r');
tmo=fread(fid,'uint16');
tmo=tmo';
fclose(fid);

end

