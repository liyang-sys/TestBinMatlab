function [ status ] = pfmwrite( input, outfilename )

fid = fopen(outfilename, 'wb');
[h, w, d] = size(input);
Imax=single(max(max(max(input))));
scale = -1.0/ Imax;
fprintf(fid, 'PF\n');
fprintf(fid, '%d %d\n', w, h);
fprintf(fid, '%f\n', scale);

A1=reshape(input(:,:,1)',1,w*h);
A2=reshape(input(:,:,2)',1,w*h);
A3=reshape(input(:,:,3)',1,w*h);
A=[A1; A2; A3];
fwrite(fid, A, 'single');
    

%for ia=1:h
%   for ib=1:w
%      fwrite(fid, input(ia,ib,:), 'single');
    %end
%end

fclose(fid);
status=0;
    
end
