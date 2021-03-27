
L1=2160; L2=4096; hL1=L1/2; hL2=L2/2;
%L1=2160; L2=3840; hL1=L1/2; hL2=L2/2;

nframe=1; frame=500
fm=0; offset=50; InBetween=6; N=L1*L2; a=zeros(L1,L2,nframe); 
fseek(fid,offset+(frame-1)*(N*1.5*2+InBetween),'bof');
for ia=frame:frame+nframe-1
   % 420 ------------------------------------------------------------------------
   b=uint16(fread(fid, [L2,L1],'uint16'))';
   u=fread(fid, [hL2,hL1],'uint16')';   v=fread(fid, [hL2,hL1],'uint16')'; 
   fseek(fid,InBetween,'cof');
   fm=fm+1;
   a(:,:,fm)=b;
end
fclose(fid);

a=a(:,:,1:fm);
clear b %u v

imwrite(uint16(a),'N_FoodMarket_f500.png');
imwrite(uint8(round(double(a)/4)),'N_FoodMarket_f500.jpg','quality',97);
