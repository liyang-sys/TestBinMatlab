function [ tmo ] = read_defaulttmoc( infilename )
% ��Ҫ������ȡͨ��Defaulttmoc���ɵ�hdr2ldr.dat����ldr2hdr.dat�ļ�
%   infilename������.dat��׺�Ķ������ļ���

fid=fopen(infilename,'r');
tmo=fread(fid,'uint16');
tmo=tmo';
fclose(fid);

end

