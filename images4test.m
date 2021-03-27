%7 ultrasound images below (all 512x512 8bit files): =============================================
%b=imread('D:\medical_images\hospital\ultrasound\20171030_0003.bmp'); %med_us1 and med_us2
%x0=224; y0=700;  %<== 03 and 04 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('D:\medical_images\hospital\ultrasound\20171030_0007.bmp'); %med_us3
%x0=224; y0=256;  %<== 07 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('D:\medical_images\hospital\ultrasound\20171030_0008.bmp'); %med_us4
%x0=224; y0=256+16;  %<== 08 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('D:\medical_images\hospital\ultrasound\20171030_0009.bmp'); %med_us5
%x0=224; y0=256-32;  %<== 09 
%c=b(x0+1:800-64,y0+1:y0+512,1);

%b=imread('D:\medical_images\hospital\ultrasound_bmps\ZHAOYING_0004.bmp'); %med_us6 and med_us7
%x0=160; y0=390;  %<== 0002 and 0004
%c=b(x0+1:x0+512,y0+1:y0+512,1);
%================================================================================================


%medical images from websites: ==================================================================
%fp=0; a0=read_uint16('\medical_images\NCSU\MRI\echo1_256x256x3_16bit.ifs',256*2,[256 256],1,3,fp); x=61; a0=a0(:,x:x+170,:);  a=zeros(512,512); a(:,1:256)=[a0(:,:,1)'; a0(:,:,2)'; a0(:,2:171,3)'];
%a0=read_uint16('\medical_images\NCSU\MRI\echo2_256x256x3_16bit.ifs',256*2,[256 256],1,3,fp); a0=a0/3*4.5; a0=a0(:,x:x+170,:); a(:,257:512)=[a0(:,:,1)'; a0(:,:,2)'; a0(:,2:171,3)']; a=a+3; a=a/max(max(a))*253;
%not used

%a0=imread('\medical_images\cornell\diaretdb\ddb1_fundusimages\image005.png'); y=30; x=180; a=double(a0(y+1:y+1024,x+1:x+1024,:)); a=round(color2Y(a)*16); a=a-13*16; a=a/max(max(a))*253*16;
%imwrite(uint16(round(a)), 'med_diaretdb_12bit.png');

%xray1 to xray6 -------------------------------------------------------------------------------
%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\boneswap1280x1408_16bit.ifs',256*2,[1280 1408],1,1,fp); 
%y=30; x=390; a=a0(y:y+895,x:x+767); a=a-670; a=a/max(max(a))*3968; 
%imwrite(uint16(round(a)), 'med_xray1_896x768_12bit.png');

%fp=1; a0=read_uint16('\medical_images\cornell\jp\Normal6\JPCNN076.img',0,[2048 2048],1,1,fp)'; 
%a=4095-a0; y=160; x=300; a=a(y:y+1535,x:x+1535); y=418; x=794; a(y,x)=(a(y-1,x)+a(y,x-1)+a(y,x+1)+a(y+1,x))/4;
%a=a-1736; a=a/max(max(a))*3968; 
%imwrite(uint16(round(a)), 'med_xray2_1536x1536_12bit.png');

%a0=imread('\medical_images\cornell\2003Mammograms1995\mdb005.pgm');  y=435; x=260; a=a0(y+1:y+512,x+1:x+512);
%imwrite(a, 'med_xray3_512x512_8bit.png');

%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\Ossify526x548_16bit.ifs',256*2,[526 548],1,1,fp); a0=a0-1468; a0=a0/max(max(a0))*3968; a=a0(8:8+511,19:19+511);
%imwrite(uint16(round(a)), 'med_xray4_512x512_12bit.png');

%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\I1_100_608x740_16bit.ifs',256*2,[608 740],1,1,fp); a0=a0(80:591,219:730)'; a0=a0-780; a=a0/max(max(a0))*3968;
%imwrite(uint16(round(a)), 'med_xray5_512x512_12bit.png');

%fp=0; a0=read_uint16('\medical_images\NCSU\x_ray\Pelvis895x732_16bit.ifs',256*2,[895 732],1,1,fp);  a0=a0-1668; a0=a0/max(max(a0))*3968; a=a0(101-20:836-20,51:51+639);
%imwrite(uint16(round(a)), 'med_xray6_736x640_12bit.png');
%------------------------------------------------------------------------------------------------

%infile='\medical_images\NCSU\ultrasound\3Decho400x430x20_8bit.ifs'; fm=1; fid=fopen(infile); fseek(fid, 111+(fm-1)*400*430, 'bof'); a0=fread(fid,[400 430],'uint8')'; fclose(fid); a=a0(11:394,9:392);
%imwrite(uint8(a), 'med_uss_384x384_8bit.png');
%================================================================================================



%2160x4096 images are generated below: ==========================================================
%infile='G:\video4k\sequence2\Netflix_Aerial_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_BarScene_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_Boat_4096x2160_60fps_10bit_420_300f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_BoxingPractice_4096x2160_60fps_10bit_420_254f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_Crosswalk_4096x2160_60fps_10bit_420_300f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_Dancers_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_DinnerScene_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_DrivingPOV_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_FoodMarket_4096x2160_60fps_10bit_420 _600f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_FoodMarket2_4096x2160_60fps_10bit_420_132f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_Narrator_4096x2160_60fps_10bit_420_300f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_PierSeaside_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile);
%infile='G:\video4k\sequence2\Netflix_RitualDance_4096x2160_60fps_10bit_420_600f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_RollerCoaster_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_SquareAndTimelapse_4096x2160_60fps_10bit_420_600f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_ToddlerFountain_4096x2160_60fps_10bit_420_1199f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_Tango_4096x2160_60fps_10bit_420_294f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_TunnelFlag_4096x2160_60fps_10bit_420_600f.y4m'; fid=fopen(infile); 
%infile='G:\video4k\sequence2\Netflix_WindAndNature_4096x2160_60fps_10bit_420_940f.y4m'; fid=fopen(infile); 

%read_y4m
%================================================================================================



%Large RGB images are generated below: ==========================================================
%infile='G:\video4k\sequence2\oldtown4k\01217.sgi'; fid=fopen(infile); offset=512; fp=1; H=2160; W=3840;
%infile='G:\video4k\sequence2\crowd4k\07111.sgi'; fid=fopen(infile); offset=512; fp=1; H=2160; W=3840;
%infile='G:\video4k\sequence2\ParkJoy\15891.sgi'; fid=fopen(infile); offset=512; fp=1; H=2160; W=3840;
%infile='G:\video4k\sequence2\InToTree\05119.sgi'; fid=fopen(infile); offset=512; fp=1; H=2160; W=3840;
%infile='G:\video4k\sequence2\DuckTakeOff\13086.sgi'; fid=fopen(infile); offset=512; fp=1; H=2160; W=3840;

%infile='\video4k\1600\Traffic_2560x1600_30_12bit_444.rgb'; fid=fopen(infile); offset=0; fp=0; H=1600; W=2560;

%read_RGB
%imwrite(uint16(a),'4k_InToTree05119.png'); imwrite(uint8(floor(double(a)/256)),'4k_InToTree05119.jpg','quality',97)
%imwrite(uint16(a),'traffic_fm1.png'); imwrite(uint8(round(a/16)),'traffic_fm1.bmp')
%================================================================================================

