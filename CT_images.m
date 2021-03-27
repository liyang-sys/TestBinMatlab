a1=double(dicomread('C:\medical_images\web\sample_images\E\7c2e3f09adf459dac1d8c7161c2d791e.dcm'));
r0=78; a1=a1(r0:r0+383,:); a1=a1/max(max(a1)); a1=uint16(round(a1*4080));
figure; imshow(double(a1)/4095)
%imwrite(a1,'CT1.png');  

a2=double(dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE2\IM350'));
r0=30; a2=a2(r0:r0+383,:); a2=a2/max(max(a2)); a2=uint16(round(a2*4080));
figure; imshow(double(a2)/4095)
%imwrite(a2,'CT2.png'); 

%a1=imread('med_xray3_512x512_8bit_original.png'); a1=uint16(round(double(a1)*1.3*16));
%imwrite(a1,'med_xray3_512x512_8bit.png');
