function [ G ] = ppmwrite( input, outfilename, inbit )
%将一幅图像转换为单通道的PPM格式的图像
%   input为输入的图像矩阵， outfilename为输出的图像，
%   inbit为输入的图像的位精度，目前只能是8位或者16位，否则结果不正确。
%   G作为函数输出，只是为了方便和产生的outfile图像进行对比，检验结果是否正确。
fid = fopen(outfilename, 'w');
[h, w, d] = size(input);
Imax=uint16(2^inbit);
fprintf(fid, 'P6\n');
fprintf(fid, '%d %d\n', w, h);
fprintf(fid, '%d\n', Imax);

if d == 3
	A1=reshape(input(:,:,1)',1,w*h);
	A2=reshape(input(:,:,2)',1,w*h);
	A3=reshape(input(:,:,3)',1,w*h);
	A=[A1; A2; A3];
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