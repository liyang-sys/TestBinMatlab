function [ status, G ] = pfmwrite_gry( input, outfilename )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
fid = fopen(outfilename, 'wb');
[h, w, d] = size(input);
Imax=single(max(max(max(input))));
scale = -1.0/ Imax;
fprintf(fid, 'Pf\n');
fprintf(fid, '%d %d\n', w, h);
fprintf(fid, '%f\n', scale);

G=double(input(:,:,1))*0.2989+double(input(:,:,2))*0.5870+double(input(:,:,3))*0.1140;
A=reshape(G',1,w*h);
fwrite(fid, A, 'single');

fclose(fid);
status=0;

end

