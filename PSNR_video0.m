load Cactus_96frames_cfp8
load Cactus_quantized_delta_10

nn=size(a); nn=nn(1)*nn(2)*nn(3)/3;

e0=a(:,:,33:64)-qa0(:,:,33:64); e0=e0.*e0; e0=sqrt(sum(sum(sum(e0)))/nn);
SNR0=20*log10(256/e0)

e=a(:,:,33:64)-qa(:,:,33:64); e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR=20*log10(256/e)

snr0=zeros(1,32); snr=snr0;

aa=zeros(1024,1024,32); aa0=aa;
[aa(:,:,1),fL]=LFP2(aa(:,:,1),8);
for ia=33:64
   ia
   e0=a(:,:,ia)-qa0(:,:,ia); e0=e0.*e0; e0=sqrt(sum(sum(sum(e0)))/(1024*1024));
   snr0(ia-32)=20*log10(256/e0);
   qa0(:,:,ia)=band2block_only((qa0(:,:,ia)),8); aa0(:,:,ia-32)=LFP2Inv(double(qa0(:,:,ia)),8,fL);
   
   e=a(:,:,ia)-qa(:,:,ia); e=e.*e; e=sqrt(sum(sum(sum(e)))/(1024*1024));
   snr(ia-32)=20*log10(256/e);
   qa(:,:,ia)=band2block_only((qa(:,:,ia)),8); aa(:,:,ia-32)=LFP2Inv(double(qa(:,:,ia)),8,fL);
end
