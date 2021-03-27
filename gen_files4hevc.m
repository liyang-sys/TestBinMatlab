%a=imread('JT_Library_fm1.png'); a1=double(a);
%a=imread('JT_Marathon_fm1.png'); a2=double(a);
%a=imread('JT_ResidentialBuilding_fm1.png'); a3=double(a);
%a=imread('JT_Runners_fm1.png'); a4=double(a);
%a=imread('JT_RushHour_fm1.png'); a5=double(a);

%a=imread('JT_BundNightscape_fm1.png'); a1=double(a);
%a=imread('JT_CampFireParty_fm1.png'); a2=double(a);
%a=imread('JT_ConstructionField_fm1.png'); a3=double(a);
%a=imread('JT_Fountains_fm1.png'); a4=double(a);
%a=imread('JT_Scarf_fm1.png'); a5=double(a);
%a=imread('JT_TallBuildings_fm1.png'); a6=double(a);
%a=imread('JT_TrafficFlow_fm1.png'); a7=double(a);
%a=imread('JT_Traffic_and_Building_fm1.png'); a8=double(a);
%a=imread('JT_TreeShade_fm1.png'); a9=double(a);
%a=imread('JT_Wood_fm1.png'); a10=double(a);
for ia=130:230,
   for ib=608:850,
      %a1(ia,ib)=101.75;a2(ia,ib)=101.75;a3(ia,ib)=101.75;a4(ia,ib)=101.75;a5(ia,ib)=101.75;
      %a6(ia,ib)=101.75;a7(ia,ib)=101.75;a8(ia,ib)=101.75;a9(ia,ib)=101.75;a10(ia,ib)=101.75;
   end
end


%a=imread('D:\medical_images\train4nerve_ultrasound\1_1.tif'); a1=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\2_1.tif'); a2=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\3_1.tif'); a3=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\4_1.tif'); a4=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\5_1.tif'); a5=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\6_1.tif'); a6=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\7_1.tif'); a7=uint16(a(3:418,3:578))*16;
%a=imread('D:\medical_images\train4nerve_ultrasound\8_1.tif'); a8=uint16(a(3:418,3:578))*16;

a=imread('\image\4k_crowd07111.png');   a=double(a)/257; a1=uint16(round( color2Y(a)*16 )); 
a=imread('4k_duck13086.png');   a=double(a)/257; a2=uint16(round( color2Y(a)*16 ));
a=imread('4k_InToTree05119.png');   a=double(a)/257; a3=uint16(round( color2Y(a)*16 ));
a=imread('\image\4k_oldtown01217.png');   a=double(a)/257; a4=uint16(round( color2Y(a)*16 ));
a=imread('\image\4k_ParkJoy15891.png');   a=double(a)/257; a5=uint16(round( color2Y(a)*16 ));

%a=imread('N_aerial_f1.png'); a1=a*4;
%a=imread('N_dinner_f900.png'); a2=a*4;
%a=imread('N_driving_f1.png'); a3=a*4;
%a=imread('N_fountain_f1.png'); a4=a*4;
%a=imread('N_wind_f1.png'); a5=a*4;
%a=imread('N_bar_f100.png'); a6=a*4;
%a=imread('N_boxing_f100.png'); a7=a*4;
%a=imread('N_coaster_f300.png'); a8=a*4;
%a=imread('N_dancers_f300.png'); a9=a*4;
%a=imread('N_narrator_f300.png'); a10=a*4;
%a=imread('N_seaside_f200.png'); a11=a*4;
%a=imread('N_tunnel_f1.png'); a12=a*4;
%a=imread('N_wind_f940.png'); a13=a*4;

%a=imread('N_boat_f1.png'); a1=a*4;
%a=imread('N_FoodMarket_f500.png'); a2=a*4;
%a=imread('N_FoodMarket_f600.png'); a3=a*4;
%a=imread('N_Tango_f1.png'); a4=a*4;
%a=imread('N_crosswalk_f1.png'); a5=a*4;
%a=imread('N_crosswalk_f300.png'); a6=a*4;
%a=imread('N_square_f1.png'); a7=a*4;
%a=imread('N_RitualDance_f300.png'); a8=a*4;

%a=imread('s1_Beauty_f33.png'); a1=a*4;
%a=imread('s1_Bosphorus_f33.png'); a2=a*4;
%a=imread('s1_HoneyBee_f33.png'); a3=a*4;
%a=imread('s1_Jockey_f33.png'); a4=a*4;
%a=imread('s1_ReadySetGo_f33.png'); a5=a*4;
%a=imread('s1_ShakeNDry_f33.png'); a6=a*4;
%a=imread('s1_YachtRide_f33.png'); a7=a*4;

%a=imread('med_us1.png'); a1=uint16(a)*16;
%a=imread('med_us2.png'); a1=uint16(a)*16;
%a=imread('med_us3.png'); a1=uint16(a)*16;
%a=imread('med_us4.png'); a1=uint16(a)*16;
%a=imread('med_us5.png'); a1=uint16(a)*16;
%a=imread('med_us6.png'); a1=uint16(a)*16;
%a=imread('med_us7.png'); a1=uint16(a)*16;

%a=imread('med_uss_384x384_8bit.png'); a1=uint16(a)*16;

%x-ray images: ---------------------------------------------------------------------------------
%a1=imread('med_xray1_896x768_12bit.png');
%a1=imread('med_xray2_1536x1536_12bit.png');
%a1=imread('med_xray6_736x640_12bit.png');

%a1=imread('med_xray3_512x512_8bit.png'); %already converted: a1=imread('med_xray3_512x512_8bit_original.png'); a1=uint16(round(double(a1)*1.3*16));
%a2=imread('med_xray4_512x512_12bit.png');
%a3=imread('med_xray5_512x512_12bit.png');
%---------------------------------------------------------------------------------------------

pt=8;
%a=dicomread('C:\medical_images\hospital\DICOM\PA0\ST0\SE1\IM64'); a=edge_smooth(a,pt); a1=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOM\PA0\ST0\SE2\IM256'); a=edge_smooth(a,pt); a2=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE1\IM0'); a=edge_smooth(a,pt); a3=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE3\IM25'); a=edge_smooth(a,pt); a4=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE4\IM200'); a=edge_smooth(a,pt); a5=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE6\IM17'); a=edge_smooth(a,pt); a6=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE7\IM19'); a=edge_smooth(a,pt); a7=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE0\IM25'); a=edge_smooth(a,pt); a8=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE1\IM25'); a=edge_smooth(a,pt); a9=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE2\IM300'); a=edge_smooth(a,pt); a10=uint16(a/max(max(a))*253*16);
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE3\IM25'); a=edge_smooth(a,pt); a11=uint16(a/max(max(a))*253*16);

%a=double(dicomread('C:\medical_images\web\sample_images\A\im2.dcm'));  a1=uint16(a/max(max(a))*253*16);
%a=double(dicomread('C:\medical_images\web\sample_images\B\0a67f9edb4915467ac16a565955898d3.dcm')); a2=uint16(a/max(max(a))*253*16);
%a=double(dicomread('C:\medical_images\web\sample_images\C\0bad9c3a3890617f78a905b78bc60f99.dcm')); a3=uint16(a/max(max(a))*253*16);
%a=double(dicomread('C:\medical_images\web\sample_images\D\6bde102d2c23f2bf33999080adc5a965.dcm')); a4=uint16(a/max(max(a))*253*16);
%a=double(dicomread('C:\medical_images\web\sample_images\E\b0123da099276a8c03d238d9ff6d3f82.dcm')); a5=uint16(a/max(max(a))*253*16);

[H,W]=size(a1);

u=uint16(zeros([H W]/2)); v=u;

bitdepth='uint16'; byte=2;
%bitdepth='uint8'; byte=1;

outfile='4k_images.yuv';  fid2=fopen(outfile,'w+');

%outfile='s1_images2160x3840_7fm_ps12bit.yuv';  fid2=fopen(outfile,'w');
%outfile='med_uss_384x384_1fm_ps12bit.yuv';  fid2=fopen(outfile,'w');
%outfile='N_images2160x4096_8fm_ps12bit.yuv';  fid2=fopen(outfile,'w');
%outfile='N_images2160x4096set2_13fm_ps12bit.yuv';  fid2=fopen(outfile,'w');
%outfile='med_xrays_512x512_3fm_12bit_ps12bit.yuv';  fid2=fopen(outfile,'w');

%outfile='JT_2160x3840_10fm_10bit.yuv';  fid2=fopen(outfile,'w');
%outfile='JT_2160x3840_10bit_set2_5fm.yuv';  fid2=fopen(outfile,'w');

%outfile='med_hospital_CT_11fm.yuv';  fid2=fopen(outfile,'w');
%outfile='med_hospital_CT_8pt_11fm.yuv';  fid2=fopen(outfile,'w');
%outfile='med_web_CT_5fm.yuv';  fid2=fopen(outfile,'w');

fwrite(fid2, a1', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth);
fwrite(fid2, a2', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth);
fwrite(fid2, a3', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth);
fwrite(fid2, a4', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth);
fwrite(fid2, a5', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a6', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth);
%fwrite(fid2, a7', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a8', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a9', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a10', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a11', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a12', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
%fwrite(fid2, a13', bitdepth); fwrite(fid2, u', bitdepth); fwrite(fid2, v', bitdepth); 
fclose(fid2);
frame=5;

%check the file below: 
fid=fopen(outfile);
a=uint16(zeros(H,W,frame)); fm=0;
for ia=1:frame
   fseek(fid,(ia-1)*W*H*1.5*byte,'bof');    Y=fread(fid, [W,H], bitdepth)';
   u=fread(fid, [W,H]/2, bitdepth)';
   v=fread(fid, [W,H]/2, bitdepth)';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);
