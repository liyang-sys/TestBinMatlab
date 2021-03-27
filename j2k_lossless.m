a=double(imread('sigma1.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma2.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma3.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma4.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma5.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma6.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma7.tif'))/257;  [a,u,v] = color2Y(a);

%5300D ======================================================================================================
%a=double(imread('\image\DSC_0075q.png'))/257;
%a=double(imread('\image\DSC_0113q.png'))/257;
%a=double(imread('\image\DSC_0184q.png'))/257;
%a=double(imread('\image\DSC_0415q.png'))/257;
%a=double(imread('\image\DSC_0436q.png'))/257;
%a=double(imread('\image\DSC_0438q.png'))/257;
%a=double(imread('\image\DSC_0455q.png'))/257;
%a=double(imread('\image\DSC_0461q.png'))/257; 

%a=double(imread('\image\DSC_0075acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0113acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0184acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0415acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0436acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0438acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0455acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0461acr2.tif'))/257; [a,u,v] = color2Y(a); 

%fuji =======================================================================================================
%a=double(imread('\image\DSCF0323.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF3485.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF5234.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\DSCF5253.tif'))/257; [a,u,v] = color2Y(a);

%nikno850D ===================================================================================================
%a=double(imread('\image\DSC_0788.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0798.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_1390.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_2118.tif'))/257; [a,u,v] = color2Y(a);

%HD and UHD images =======================================================================================
%UHD images --------------------------------------------------------------
%a=imread('\image\4k_crowd07111.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\4k_oldtown01217.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\4k_ParkJoy15891.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\JT_Scarf_fm200.png');  a=double(a)/4;
%HD images ---------------------------------------------------------------
%a=imread('\image\Beauty.png');  a=double(a)/4;
%a=imread('\image\HoneyBee.png');  a=double(a)/4;
%a=imread('\image\Kimino_fm1.png');  a=double(a)/4; 
%a=imread('\image\Kimino_fm220.png');  a=double(a)/4;

%medical images: ==============================================================================================    
%xrays, 2 different sizes: ---------------------------------------------
%a=double(imread('\image\med_xray1_896x768_12bit.png'))/16;
%a=double(imread('\image\med_xray8_736x640_12bit.png'))/16;
%xrays, 3 1536x1536 xrays: -----------------------------------------------
%a=double(imread('\image\med_xray2_1536x1536_12bit.png'))/16;
%a=double(imread('\image\med_xray3_1536x1536_12bit.png'))/16;
%a=double(imread('\image\med_xray4_1536x1536_12bit.png'))/16;
%xrays, 3 512x512 xrays: -----------------------------------------------
%a=double(imread('\image\med_xray5_512x512_8bit.png'))/16;
%a=double(imread('\image\med_xray6_512x512_12bit.png'))/16;
%a=double(imread('\image\med_xray7_512x512_12bit.png'))/16;


imwrite(uint8(round(a)), '\image\lossless_8bit.jp2', 'Mode','lossless');
x8bit=dir('\image\lossless_8bit.jp2');
rate8bit=x8bit.bytes*8/numel(a)

imwrite(uint16(round(4*a)), '\image\lossless_10bit.jp2', 'Mode','lossless');
x10bit=dir('\image\lossless_10bit.jp2');
rate10bit=x10bit.bytes*8/numel(a)
