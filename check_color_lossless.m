%a=double(imread('\image\DSC_0075acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0113acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0184acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0415acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0436acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0438acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0455acr2.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0461acr2.tif'))/257; [y,u,v] = color2Y(a); 

%a=imread('\image\4k_crowd07111.png');  a=double(a)/257; y=color2Y(a);
%a=imread('\image\4k_oldtown01217.png');  a=double(a)/257; y=color2Y(a);
%a=imread('\image\4k_ParkJoy15891.png');  a=double(a)/257; y=color2Y(a);

%a=double(imread('\image\DSC_0788.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0798.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_1390.tif'))/257; [y,u,v] = color2Y(a);
%a=double(imread('\image\DSC_2118.tif'))/257; [y,u,v] = color2Y(a);

%a=double(imread('\image\DSCF0323.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('\image\DSCF3485.tif'))/257;  [y,u,v] = color2Y(a);
a=double(imread('\image\DSCF5234.tif'))/257;  [y,u,v] = color2Y(a);
%a=double(imread('\image\DSCF5253.tif'))/257; [y,u,v] = color2Y(a);



a=uint8(a);
y=uint8((y-16)*255/219);

imwrite(y, '\image\lossless_8bit.jp2', 'Mode','lossless');
x8bit=dir('\image\lossless_8bit.jp2');
rate1=x8bit.bytes
imwrite(a, '\image\lossless_8bit.jp2', 'Mode','lossless');
x8bit=dir('\image\lossless_8bit.jp2');
rate3=x8bit.bytes

rate3/rate1
