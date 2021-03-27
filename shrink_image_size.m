a=double(imread('Fuji4_color_original_8bit.tif'));
[H,W]=size(a);

a = a(1:2:H,:,:) +a(2:2:H,:,:);
a = a(:,1:2:W,:) +a(:,2:2:H,:);

