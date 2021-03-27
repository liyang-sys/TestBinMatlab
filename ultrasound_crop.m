%H=1024; W=800;
%fid=fopen('F:\ultrasound\201710301_0001'); a=fread(fid,H*W*3,'uint8')'; fclose(fid);
%a=reshape(a,3,H*W); a1=a(1,:); a1=reshape(a1,H,W);
%figure; imshow(a1'/255)

%b=imread('F:\ultrasound\20171030_0009.bmp');
%x0=224; y0=256-32;  %<== 09C 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('F:\ultrasound\20171030_0007.bmp');
%x0=224; y0=256;  %<== 07A 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('F:\ultrasound\20171030_0008.bmp');
%x0=224; y0=256+16;  %<== 08A 
%c=b(x0+1:800-64,y0+1:y0+512,1);

b=imread('F:\ultrasound\20171030_0004.bmp');
x0=224; y0=700;  %<== 03A and 04A 
c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('D:\ultrasound\ZHAOYING_0004.bmp'); %This image is in D:
%x0=160; y0=390;  %<== 04L and 02L
%c=b(x0+1:x0+512,y0+1:y0+512,1);

figure; imshow(c)


