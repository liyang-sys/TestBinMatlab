function [ G ] = ppmwrite_gry( input, outfilename, inbit )
%��һ��ͼ��ת��Ϊ��ͨ����PPM��ʽ��ͼ��
%   inputΪ�����ͼ����� outfilenameΪ�����ͼ��
%   inbitΪ�����ͼ���λ���ȣ�Ŀǰֻ����8λ����16λ������������ȷ��
%   G��Ϊ���������ֻ��Ϊ�˷���Ͳ�����outfileͼ����жԱȣ��������Ƿ���ȷ��
fid = fopen(outfilename, 'w');
[h, w, d] = size(input);
Imax=uint16(2^inbit);
fprintf(fid, 'P5\n');
fprintf(fid, '%d %d\n', w, h);
fprintf(fid, '%d\n', Imax);

if d == 3
    G=rgb2gray(input);
    A=reshape(G',1,w*h);
    if inbit==16
        fwrite(fid, A, 'uint16','ieee-be');
    else
        fwrite(fid, A, 'uint8');
    end
else
    G=input;
    A=reshape(G',1,w*h);
    if inbit==16
        fwrite(fid, A, 'uint16','ieee-be');
    else
        fwrite(fid, A, 'uint8');
    end
end

fclose(fid);
end
