%load memorial
%load rand05
load Valley

figure; idx=1; plot(Valley{idx}(1,:), Valley{idx}(2,:),'b.-'); hold on; grid on;
for ia=2:11
   plot(Valley{ia}(1,:), Valley{ia}(2,:),'.-')
end
figure; idx=1; plot(Valley{idx}(1,:), Valley{idx}(3,:),'b.-'); hold on; grid on;
for ia=2:11
   plot(Valley{ia}(1,:), Valley{ia}(3,:),'.-')
end


!GetTmoLDR  \HDRimage\selected_test_images\SpheronNapaValley.pfm

%!jpegXT -ol -r -Q 90 -q 90 \HDRimage\selected_test_images\SpheronNapaValley.pfm   Valley9090.jpg %not a good choice for profile C

%!jpegXT -r -h -Q 90 -q 90  -profile c -rR 4 \HDRimage\selected_test_images\SpheronNapaValley.pfm   Valley9090.jpg
!jpegXT -ol -r -h -Q 90 -q 90 -profile a \HDRimage\selected_test_images\SpheronNapaValley.pfm   Valley9090.jpg
%!jpegXT -ol -r -h -Q 90 -q 90 -profile b \HDRimage\selected_test_images\SpheronNapaValley.pfm   Valley9090.jpg

!jpegXT Valley9090.jpg ValleyJXT9090.pfm

hdr=pfmread('ValleyJXT9090.pfm');     
hdr0=pfmread('\HDRimage\selected_test_images\SpheronNapaValley.pfm'); mx=double(max(max(max(hdr0))));
snrQ=psnr(double(hdr)/mx,double(hdr0)/mx)  

ldr0=ppmread('tmoldr.ppm'); ldr=imread('Valley9090.jpg');      
snrq=psnr(ldr,ldr0) 

x=dir('Valley9090.jpg');  rate=x.bytes*8/(numel(hdr0)/3)

