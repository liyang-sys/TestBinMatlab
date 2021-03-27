load Cactus_96frames
%load Cactus_quantized_cfp4_delta_2p15
%load Cactus_quantized_cfp8_delta_2p15

%load ParkScene_96frames
%load ParkScene_quantized_cfp8_delta_2p15

%load Kimono_96frames
%load Kimono_quantized_cfp8_delta_2p15

nn=size(a); nn=nn(1)*nn(2)*nn(3)/3;

e=a(:,:,33:64)/4-qa(:,:,33:64); e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR=20*log10(256/e)

snr=zeros(1,32);

for ia=33:64
   e=a(:,:,ia)/4-qa(:,:,ia); e=e.*e; e=sqrt(sum(sum(sum(e)))/(1024*1024));
   snr(ia-32)=20*log10(256/e);
end
