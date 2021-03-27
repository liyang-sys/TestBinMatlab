   %for papers =====================================================================================
infile='\SignifProp\lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='\SignifProp\barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='\SignifProp\goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('\SignifProp\mandrill_corrected.bmp'));
%a=double(imread('\SignifProp\boat.tif'));
%a=double(imread('\SignifProp\zelda.tif'));

%infile='\SignifProp\bike.bin'; fid=fopen(infile); a=double(fread(fid,[2560 2048],'uint8')); fclose(fid);
%infile='\SignifProp\cafe.bin'; fid=fopen(infile); a=double(fread(fid,[2560 2048],'uint8')); fclose(fid);
%infile='\SignifProp\woman.bin'; fid=fopen(infile); a=double(fread(fid,[2560 2048],'uint8')); fclose(fid);


%load \SignifProp\ParkScene; %x=890; y=1; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\CrowdRun;  %x=690; y=1; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\Kimono1_10bit;  %x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load \SignifProp\SteamLocomotiveTrain_10bit;  x=1070; y=310; a=Y(y:y+1023,x:x+1023);

%load birds_fm33;  a=a/4; %There is a mistake: should be fm34! However, there should not be big differences
%load oldtown_fm33;  a=a/4; %There is a mistake: should be fm34! However, there should not be big differences
%load cactus_fm33;  %There is a mistake: should be fm34! However, there should not be big differences
%load festival_fm56;  a=a/4; 


%medical images below:  -----------------------------------------------------------------------------
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!========================
%medical image information is shown in \image\xray_images_original.m
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!========================


%a0=imread('\medical_images\cornell\diaretdb\ddb1_fundusimages\image005.png'); y=30; x=180; a=double(a0(y+1:y+1024,x+1:x+1024,:)); a=round(color2Y(a)*16)/16; a=a-13; a=a/max(max(a))*253;
%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\boneswap1280x1408_16bit.ifs',256*2,[1280 1408],1,1,fp); y=43; x=300; a0=a0(y:y+1023,x:x+1023); a0=a0-700; a0=a0/max(max(a0))*253; a=a0;

%fp=1; a0=read_uint16('\medical_images\cornell\jp\Normal6\JPCNN076.img',0,[2048 2048],1,1,fp)'; a0=4095-a0; y=170; x=300; a0=a0(y:y+1535,x:x+1535); 
%y=418; x=794; a0(y,x)=(a0(y-1,x)+a0(y,x-1)+a0(y,x+1)+a0(y+1,x))/4; a=a0-1760; a=a/max(max(a))*253;
%a=a(1:1024,1:1024); %pre_test

%a0=imread('\medical_images\cornell\2003Mammograms1995\mdb005.pgm');  y=430; x=250; a=double(a0(y+1:y+512,x+1:x+512)); a=a/max(max(a))*253; 

%fp=0; a0=read_uint16('\medical_images\NCSU\MRI\echo1_256x256x3_16bit.ifs',256*2,[256 256],1,3,fp); x=61; a0=a0(:,x:x+170,:);  a=zeros(512,512); a(:,1:256)=[a0(:,:,1)'; a0(:,:,2)'; a0(:,2:171,3)'];
%a0=read_uint16('\medical_images\NCSU\MRI\echo2_256x256x3_16bit.ifs',256*2,[256 256],1,3,fp); a0=a0/3*4.5; a0=a0(:,x:x+170,:); a(:,257:512)=[a0(:,:,1)'; a0(:,:,2)'; a0(:,2:171,3)']; a=a+3; a=a/max(max(a))*253;

%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\Ossify526x548_16bit.ifs',256*2,[526 548],1,1,fp); a0=a0-1496; a0=a0/max(max(a0))*253; a=a0(8:8+511,19:19+511);
%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\I1_100_608x740_16bit.ifs',256*2,[608 740],1,1,fp); a0=a0(80:591,219:730)'; a0=a0-815; a=a0/max(max(a0))*253;

%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\Pelvis895x732_16bit.ifs',256*2,[895 732],1,1,fp); a0=a0(301:812,80:591); a0=a0-1500; a=a0/max(max(a0))*253;

%infile='\medical_images\NCSU\ultrasound\3Decho400x430x20_8bit.ifs'; fm=1; fid=fopen(infile); fseek(fid, 111+(fm-1)*400*430, 'bof'); a0=fread(fid,[400 430],'uint8')'; fclose(fid); a=a0(11:394,9:392);
%a=[a0 5*ones(430,112); 5*ones(82,512)]; %for pre_test only
%a=a0(88:88+255,73:73+255); %this size 256x256 works

%===============================================================================================
%a=imread('traffic_fm1_rgb.png');  a=double(a)/16; a=color2Y(a);

%a=imread('4k_crowd07111.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_duck13086.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_InToTree05119.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_oldtown01217.png');  a=double(a)/256; a=color2Y(a);
%a=imread('4k_ParkJoy15891.png');  a=double(a)/256; a=color2Y(a);

%a=imread('s1_Beauty_f33.png'); a=double(a)/4;
%a=imread('s1_Bosphorus_f33.png'); a=double(a)/4;
%a=imread('s1_HoneyBee_f33.png'); a=double(a)/4;
%a=imread('s1_Jockey_f33.png'); a=double(a)/4;
%a=imread('s1_ReadySetGo_f33.png'); a=double(a)/4;
%a=imread('s1_ShakeNDry_f33.png'); a=double(a)/4;
%a=imread('s1_YachtRide_f33.png'); a=double(a)/4;

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%This set of images have been quantized using the 9/7 filters !!! cannot be used for test !!!
%a=imread('N_aerial_f1.png'); a=double(a)/4;
%a=imread('N_dinner_f900.png'); a=double(a)/4;
%a=imread('N_driving_f1.png'); a=double(a)/4;
%a=imread('N_fountain_f1.png'); a=double(a)/4;
%a=imread('N_wind_f1.png'); a=double(a)/4;

%a=imread('N_bar_f100.png'); a=double(a)/4;
%a=imread('N_boxing_f100.png'); a=double(a)/4;
%a=imread('N_coaster_f300.png'); a=double(a)/4;
%a=imread('N_dancers_f300.png'); a=double(a)/4;
%a=imread('N_narrator_f300.png'); a=double(a)/4;
%a=imread('N_seaside_f200.png'); a=double(a)/4;
%a=imread('N_tunnel_f1.png'); a=double(a)/4;
%a=imread('N_wind_f940.png'); a=double(a)/4;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%a=imread('N_boat_f1.png'); a=double(a)/4;
%a=imread('N_FoodMarket_f500.png'); a=double(a)/4;
%a=imread('N_FoodMarket_f600.png'); a=double(a)/4;
%a=imread('N_Tango_f1.png'); a=double(a)/4;
%a=imread('N_crosswalk_f1.png'); a=double(a)/4;
%a=imread('N_crosswalk_f300.png'); a=double(a)/4;
%a=imread('N_square_f1.png'); a=double(a)/4;
%a=imread('N_RitualDance_f300.png'); a=double(a)/4;

%a=imread('med_us1.png'); a=double(a);
%a=imread('med_us2.png'); a=double(a);
%a=imread('med_us3.png'); a=double(a);
%a=imread('med_us4.png'); a=double(a);
%a=imread('med_us5.png'); a=double(a);
%a=imread('med_us6.png'); a=double(a);
%a=imread('med_us7.png'); a=double(a);
%a=imread('med_uss_384x384_8bit.png'); a=double(a);

%a=imread('D:\medical_images\train4nerve_ultrasound\1_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\2_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\3_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\4_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\5_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\6_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\7_1.tif'); a=double(a(3:418,3:578));
%a=imread('D:\medical_images\train4nerve_ultrasound\8_1.tif'); a=double(a(3:418,3:578));

%a=imread('med_xray1_896x768_12bit.png'); a=double(a)/16;
%a=imread('med_xray2_1536x1536_12bit.png'); a=double(a)/16;
%a=imread('med_xray6_736x640_12bit.png'); a=double(a)/16;
%a=imread('med_xray3_512x512_8bit.png'); a=double(a)*1.3;
%a=imread('med_xray4_512x512_12bit.png'); a=double(a)/16;
%a=imread('med_xray5_512x512_12bit.png'); a=double(a)/16;

%a=imread('JT_Library_fm1.png'); a=double(a)/4;
%a=imread('JT_Marathon_fm1.png'); a=double(a)/4;
%a=imread('JT_ResidentialBuilding_fm1.png'); a=double(a)/4;
%a=imread('JT_Runners_fm1.png'); a=double(a)/4;
%a=imread('JT_RushHour_fm1.png'); a=double(a)/4;

%a=imread('JT_BundNightscape_fm1.png'); a=double(a)/4;
%a=imread('JT_CampFireParty_fm1.png'); a=double(a)/4;
%a=imread('JT_ConstructionField_fm1.png'); a=double(a)/4;
%a=imread('JT_Fountains_fm1.png'); a=double(a)/4;
%a=imread('JT_Scarf_fm1.png'); a=double(a)/4;
%a=imread('JT_TallBuildings_fm1.png'); a=double(a)/4;
%a=imread('JT_TrafficFlow_fm1.png'); a=double(a)/4;
%a=imread('JT_Traffic_and_Building_m1.png'); a=double(a)/4;
%a=imread('JT_TreeShade_fm1.png'); a=double(a)/4;
%a=imread('JT_Wood_fm1.png'); a=double(a)/4;
%for ia=130:230, for ib=608:850, a(ia,ib)=101.75; end; end

%a=imread('JT6V.png'); a=double(a)/4;

pt=8;
%a=dicomread('C:\medical_images\hospital\DICOM\PA0\ST0\SE1\IM64'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOM\PA0\ST0\SE2\IM256'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE1\IM0'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE3\IM25'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE4\IM200'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE6\IM17'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMA\PA0\ST0\SE7\IM19'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE0\IM25'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE1\IM25'); a=edge_smooth(a,pt); a=a/max(max(a))*253;
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE2\IM300'); [a0,mk,a]=edge_smooth(a,pt); 
%a=dicomread('C:\medical_images\hospital\DICOMB\PA0\ST0\SE3\IM25'); a=edge_smooth(a,pt); a=a/max(max(a))*253;

%a=double(dicomread('C:\medical_images\web\sample_images\A\im2.dcm')); a=a/max(max(a))*253;
%a=double(dicomread('C:\medical_images\web\sample_images\B\0a67f9edb4915467ac16a565955898d3.dcm')); a=a/max(max(a))*253;
%a=double(dicomread('C:\medical_images\web\sample_images\C\0bad9c3a3890617f78a905b78bc60f99.dcm')); a=a/max(max(a))*253;
%a=double(dicomread('C:\medical_images\web\sample_images\D\6bde102d2c23f2bf33999080adc5a965.dcm')); a=a/max(max(a))*253;
%a=double(dicomread('C:\medical_images\web\sample_images\E\b0123da099276a8c03d238d9ff6d3f82.dcm')); a=a/max(max(a))*253;


%load \SignifProp\Traffic_12bit;  x=1350; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%load \SignifProp\PeopleOnStreet_8bit;  x=310; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper

%a=double(imread('cafe_square_small.bmp'));
%a=double(imread('bike_square_small.bmp'));
%a=double(imread('woman_square_small.bmp'));

%a=double(imread('DSC_0075acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0076acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0113acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0180acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0183acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0184acr.tif'))/257; [a,u,v] = color2Y(a);

%a=double(imread('DSC_0410acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0415acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0436acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0438acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0455acr.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('DSC_0461acr.tif'))/257; [a,u,v] = color2Y(a); 

%a=double(imread('\image\DSC_0075acr2.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_0076acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0113acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0184acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0415acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0436acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0438acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0455acr2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\DSC_0461acr2.tif'))/257; [a,u,v] = color2Y(a); 

%a=double(imread('\image\32images\Nikon_5300D1.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D2.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D3.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D4.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D5.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D6.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D7.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_5300D8.tif'))/257; [a,u,v] = color2Y(a);

%a=double(imread('\image\DSC_0075q.png'))/257;
%a=double(imread('\image\DSC_0113q.png'))/257;
%a=double(imread('\image\DSC_0184q.png'))/257;
%a=double(imread('\image\DSC_0415q.png'))/257;
%a=double(imread('\image\DSC_0436q.png'))/257;
%a=double(imread('\image\DSC_0438q.png'))/257;
%a=double(imread('\image\DSC_0455q.png'))/257;
%a=double(imread('\image\DSC_0461q.png'))/257; 


%nikno850D ===================================================================================================
%a=double(imread('\image\32images\Nikon_850D1.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_1104.tif'))/257; [a,u,v] = color2Y(a);
%set2 --------------------------------------------------------------------------------------------------------
    %a=double(imread('DSC_0630.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_0783.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D2.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_1256.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_1314.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D3.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_2056.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSC_2061.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Nikon_850D4.tif'))/257; [a,u,v] = color2Y(a);

%sigma =======================================================================================================
%a=double(imread('sigma1.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma2.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma3.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma4.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma5.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma6.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('sigma7.tif'))/257;  [a,u,v] = color2Y(a);

%fuji =======================================================================================================
    %a=double(imread('DSCF0044.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji1.tif'))/257;  [a,u,v] = color2Y(a);
    %a=double(imread('DSCF0509.tif'))/257;  [a,u,v] = color2Y(a);
    %a=double(imread('DSCF0705.tif'))/257;  [a,u,v] = color2Y(a);
    %a=double(imread('DSCF0780.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji2.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji3.tif'))/257;  [a,u,v] = color2Y(a);
%Fuji set2 -----------------------------------------------------------------------------------------------------
    %a=double(imread('DSCF0430.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSCF0528.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSCF0652.tif'))/257; [a,u,v] = color2Y(a);
%a=double(imread('\image\32images\Fuji4.tif'))/257;  [a,u,v] = color2Y(a);
%a=double(imread('\image\pgm\Fuji4.pgm'))/16;
    %a=double(imread('DSCF5368.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSCF5412.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSCF5424.tif'))/257; [a,u,v] = color2Y(a);
    %a=double(imread('DSCF9044.tif'))/257; [a,u,v] = color2Y(a);
%a=u;
%a=round(a*16)/16;
    
%medical images: ==============================================================================================    
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!========================
%medical image information is shown in \image\xray_images_original.m
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!========================
%a=double(imread('\image\CT1.png'))/16;
%a=double(imread('\image\CT2.png'))/16;
%xrays, 2 different sizes: ---------------------------------------------
%a=double(imread('\image\32images\xray1.png'))/16;
%a=double(imread('\image\32images\xray8.png'))/16;     %a=double(imread('\image\med_xray8_736x640_12bit.png'))/16;
%xrays, 3 1536x1536 xrays: -----------------------------------------------
%a=double(imread('\image\32images\xray2.png'))/16;
%a=double(imread('\image\32images\xray3.png'))/16;
%a=double(imread('\image\32images\xray4.png'))/16;
%xrays, 3 512x512 xrays: -----------------------------------------------
%a=double(imread('\image\32images\xray5.png'))/16;
%a=double(imread('\image\32images\xray6.png'))/16;
%a=double(imread('\image\32images\xray7.png'))/16;


%a=Y(:,1:1920);
%a=round(a); %<=== rounding here makes the PSNR lower for 10-bit images !!!!!!!!!!!!!!!!!
%a=a(:,9:4088)/4;
%a=a(513:2048,1:2048)/4;

%a=a(513:2048,1:1024)/4; %<=== bug
%a=a(:,9:2040)/4; %<===== bug ???

%HD and UHD images =======================================================================================
%UHD images --------------------------------------------------------------
%a=imread('\image\32images\UHD1.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\32images\UHD2.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\32images\UHD3.png');  a=double(a)/257; a=color2Y(a);
%a=imread('\image\32images\UHD4.png');  a=double(a)/4;
%HD images ---------------------------------------------------------------
%a=imread('\image\birds_fm220.png');  a=double(a)/4; %<=== not used, problem?!
%a=imread('\image\Ducks_fm100.png');  a=double(a)/4; %<=== not used, problem?!
%--------------------------------------------------------------
%a=imread('\image\32images\HD1.png'); a=double(a)/4;   %a=imread('\image\Beauty.png');  a=double(a)/4;
%a=imread('\image\32images\HD2.png'); a=double(a)/4;   %a=imread('\image\HoneyBee.png');  a=double(a)/4;
%a=imread('\image\32images\HD3.png'); a=double(a)/4;   %a=imread('\image\Kimino_fm1.png');  a=double(a)/4; 
%a=imread('\image\32images\HD4.png'); a=double(a)/4;   %a=imread('\image\Kimino_fm220.png');  a=double(a)/4;


N=size(a); 

%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2band_7lev(coef,4,tanTheta);
%[coef,fL]=LFP2(a,8);  tanTheta=1/8; coef=block2band(coef,8,tanTheta); %<=====LFP

%T=delta;

%coef=dy79decm(a);
%coef=Nondy79decm_3lev_PlusCFP2(a);
%coef=dy79decm_3lev_PlusCFP2(a);
%coef=dy79decm_4lev_PlusCFP2(a);
%Lev=6; coef=CFP2bd_Lev(a,Lev);

%M=4; lev=4; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP
%coef=coef_reorder(coef);
%M=16; lev=2; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta); %<=====LFP

%[coef,hh,gg,hhh,ggg]=SWP2modified(a,4); %coef=wp2tree(coef,4,2,1); %The latest version of SWP


coef0=coef;

%qcoef=quantVariableDeadZone(coef,delta);
%[Nnon,zone0,subzone,subcoef]=Coef_Statistics(qcoef);
%clear qcoef coef

%[Nnon,zone0,subzone,subcoef]=Coef_Statistics(coef);
