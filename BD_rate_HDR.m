%load rend05
%load memorial
%load Valley %memorial
%load Tree
%load MtTamWest
%load SpheronNice
load SpheronPriceWestern
%load belgium
%load synagogue

F=f;
NF=length(F); 

plt=1;
if plt
   %tem=MtTamWest;
   %tem=synagogue;
   tem=SpheronPriceWestern;
   figure; idx=1; plot(tem{idx}(1,:), tem{idx}(2,:),'b.-'); hold on; grid on;
   for ia=2:NF
      plot(tem{ia}(1,:), tem{ia}(2,:),'.-')
   end
   figure; idx=1; plot(tem{idx}(1,:), tem{idx}(3,:),'b.-'); hold on; grid on;
   for ia=2:NF
      plot(tem{ia}(1,:), tem{ia}(3,:),'.-')
   end
end

%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%===========================================================================================================================
%open loop is not a good choice for profile C: -----------------------------------------------
%!jpegXT -ol -r -h -Q 90 -q 90 -rR 4 \HDRimage\selected_test_images\memorial.pfm   Valley9090.jpg 
%profile b seems to use a wrong (or different) default tone mapping:  ------------------------
%!jpegXT -ol -r -h -Q 99 -q 99 -profile b \HDRimage\selected_test_images\memorial.pfm   Valley9090.jpg
%===========================================================================================================================
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


%============================================================================================================================
%Get the LDR image: ---------------------------------------------------------------------------
%hdr0=pfmread('\HDRimage\selected_test_images\memorial.pfm'); mx=double(max(max(max(hdr0))));
%hdr0=pfmread('\HDRimage\selected_test_images\MtTamWest.pfm'); mx=double(max(max(max(hdr0))));
%hdr0=pfmread('\HDRimage\selected_test_images\dani_synagogue.pfm'); mx=double(max(max(max(hdr0))));
hdr0=pfmread('\HDRimage\selected_test_images\SpheronPriceWestern.pfm'); mx=double(max(max(max(hdr0))));
ldri=hdr2ldr(hdr0,hdr0);  imwrite(uint8(round(ldri)),'tmoldr.ppm');
%!GetTmoLDR  \HDRimage\selected_test_images\memorial.pfm


%Different profiles ---------------------------------------------------------------------------
%!jpegXT -r -h -Q 30 -q 30 -ldr tmoldr.ppm -profile c -rR 4 \HDRimage\selected_test_images\memorial.pfm   Valley9090.jpg
%!jpegXT -ol -r -h -Q 80 -q 80 -ldr tmoldr.ppm -profile a \HDRimage\selected_test_images\memorial.pfm   Valley9090.jpg
%!jpegXT -ol -r -h -Q 99 -q 99 -ldr tmoldr.ppm -profile b \HDRimage\selected_test_images\memorial.pfm   Valley9090.jpg

%!jpegXT -ol -r -h -Q 50 -q 50 -ldr tmoldr.ppm -profile a \HDRimage\selected_test_images\MtTamWest.pfm   Valley9090.jpg
%!jpegXT -ol -r -h -Q 30 -q 30 -ldr tmoldr.ppm -profile a \HDRimage\selected_test_images\dani_synagogue.pfm   Valley9090.jpg
!jpegXT -ol -r -h -Q 50 -q 50 -ldr tmoldr.ppm -profile a \HDRimage\selected_test_images\SpheronPriceWestern.pfm   Valley9090.jpg



%decoding JXT-----------------------------------------------------------------------------------
!jpegXT Valley9090.jpg ValleyJXT9090.pfm
hdr=pfmread('ValleyJXT9090.pfm');    
snQXT=psnr(double(hdr)/mx,double(hdr0)/mx)  
%The LDR images: -------------------------------------------------------------------------------
ldr0=ppmread('tmoldr.ppm'); ldr=imread('Valley9090.jpg');      snqXT=psnr(ldr,ldr0),
ldr_from_hdr=hdr2ldr(hdr0,hdr);   snqQ=psnr(uint8(ldr_from_hdr),ldr0)
%The rate --------------------------------------------------------------------------------------
x=dir('Valley9090.jpg');  rateXT=x.bytes*8/(numel(hdr0)/3)
%-----------------------------------------------------------------------------------------------


[snQXT, snqXT, rateXT]
%xxx=memorial;
%xxx=MtTamWest;
%xxx=synagogue;
%xxx=SpheronPriceWestern;

xxx=tem;
%==============================================================================================================================
rateH=zeros(1,NF);   snrq=zeros(1,NF);   %idx=ones(1,NF);
for ia=1:NF
   rat=flip(xxx{ia}(1,:));  snQ=flip(xxx{ia}(2,:));   snq=flip(xxx{ia}(3,:));
   idx=1; 
   while (snQ(idx)<snQXT)   &&   (idx<length(snQ))
      idx=idx+1;
   end
   %idx
   %[snQ(idx-1) snQ(idx), rat(idx-1), rat(idx)]
   if idx>1
      rateH(ia) = (rat(idx)-rat(idx-1))/(snQ(idx)-snQ(idx-1)) *(snQXT-snQ(idx-1))  +rat(idx-1);
      snrq(ia) = (snq(idx)-snq(idx-1))/(rat(idx)-rat(idx-1)) *(rateH(ia)-rat(idx-1))  +snq(idx-1);
   else
      if snQ(idx)-snQXT < snQ(idx+1)-snQ(idx)
         rateH(ia) = (rat(idx+1)-rat(idx))/(snQ(idx+1)-snQ(idx)) *(snQXT-snQ(idx))  +rat(idx);
         snrq(ia) = (snq(idx+1)-snq(idx))/(rat(idx+1)-rat(idx)) *(rateH(ia)-rat(idx))  +snq(idx);
      else
         rateH(ia) = rat(idx) - (rat(idx+1)-rat(idx));
         snrq(ia) = snq(idx) - (snq(idx+1)-snq(idx));
      end
   end
end
idx,rateH,snrq

[Rsort,iRsort]=sort(rateH);
%iRsort
F_sort=F(iRsort); snrq_sort=snrq(iRsort); rateH_sort=rateH(iRsort);

idx=1;
while  (snrq_sort(idx)<snqXT)   &&  (idx<NF)
   idx=idx+1;
end
%idx
F_constiv=F_sort(idx),   rate_constiv=rateH_sort(idx),   BDrate_constiv=(rate_constiv-rateXT)/rateXT *100

if idx>1
   rate_est = (rateH_sort(idx)-rateH_sort(idx-1))/(snrq_sort(idx)-snrq_sort(idx-1)) *(snqXT-snrq_sort(idx-1))  +rateH_sort(idx-1)
   F_est = (F_sort(idx)-F_sort(idx-1))/(snrq_sort(idx)-snrq_sort(idx-1)) *(snqXT-snrq_sort(idx-1))  +F_sort(idx-1)
   BDrate_est=(rate_est-rateXT)/rateXT *100
else
   rate_est=rate_constiv, F_est=F_constiv, BDrate_est=BDrate_constiv, 
end
