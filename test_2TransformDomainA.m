infile='lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('mandrill.tif'));
%a=double(imread('mandrill_corrected.bmp'));
%a=double(imread('boat.tif'));
%a=double(imread('zelda.tif'));
%a=a(17:496,17:496);

%infile='bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%a=a(257:2304,:);


%a=double(imread('man.tiff'));

%a=double(imread('GorgeSt2.bmp'));
%a=double(imread('floriade5.bmp'));
%a=double(imread('GorgeSt_bw.bmp')); 
%a=double(imread('floriade_bw.bmp'));

%load Traffic_12bit; a=Y; clear Y
%load SteamLocomotiveTrain_10bit; a=Y; clear Y
%load NebutaFestival_10bit; a=Y; clear Y
%load PeopleOnStreet_8bit; a=Y; clear Y

%load BirdsInCage; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load BQTerrace_8bit_frame1; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load BQTerrace_8bit_frame500; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Cactus_8bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_10bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_8bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_8bit_frame240; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load ParkScene; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load ParkScene_frame200; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load CrowdRun; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load KristenAndSara_8bit_frame1; Y=Y(1:704,:); u=u(1:352,:); v=v(1:352,:);
%load FourPeople_8bit_frame600; Y=Y(1:704,:); u=u(1:352,:); v=v(1:352,:);


%n=0; m=0; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));

%a=v;



%load BirdsInCage; x=510; y=57; a=Y(y:y+1023,x:x+1023); 
%load ParkScene; x=890; y=1; a=Y(y:y+1023,x:x+1023);
%load CrowdRun;  x=690; y=1; a=Y(y:y+1023,x:x+1023);
%load Kimono1_10bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load Cactus_8bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load SteamLocomotiveTrain_10bit;  x=1070; y=310; a=Y(y:y+1023,x:x+1023);
%load Traffic_12bit;  x=1350; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%load PeopleOnStreet_8bit;  x=310; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%a=a(33:496*2,33:496*2);


N=size(a);


%aa=round(a);
%e=(a-aa); e=sqrt( sum(sum(e.*e))/(N(1)*N(2)) );
%SN=20*log10(255/e); fprintf('%5.2f\n',SN);
%SN 58.93 dB for 'Traffic_12bit'


%coef=dy79decm(a);
%coef=dy79decm_5lev(a);
%coef=dy79decm_3lev(a);
%coef=dy53decm(a);

%tanTheta=1/8; coef=CFPdyadic1(a,tanTheta);  %the PTV

%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2tree4bandC(coef,tanTheta);
%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2band(coef,4,tanTheta);
%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====LFP
%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2band(coef,8,tanTheta); %<=====LFP
Ns=8;
[coef,fL]=LFP2(a,Ns); tanTheta=1/8; coef=block2band_5lev(coef,Ns,tanTheta); %<=====LFP

%[coef,hh,gg,hhh,ggg]=swp2modified(a); %coef=wp2tree(coef,4,2,1); %The latest version of SWP


T=[300,160, 90, 50, 30, 17, 9, 5, 3, 1.5];
SN=zeros(1,length(T));

for ia=1:length(T)
   [coeft,nonzero]=threshold(coef,T(ia));
   Nnon=Coef_Statistics_5lev(coeft);
   [coef90,nonzero90]=threshold(coef,T(ia)*0.9);
   del_coef=coef90-coeft; 
   del_eng=sum(sum(del_coef.*del_coef));
   del_N=nonzero90-nonzero;
   slopc90=del_eng/del_N;
   
   [coef50,nonzero50]=threshold(coef,T(ia)*0.5);
   del_coef=coef50-coeft; 
   del_eng=sum(sum(del_coef.*del_coef));
   del_N=nonzero50-nonzero;
   slopc50=del_eng/del_N;
   
   [coef25,nonzero25]=threshold(coef,T(ia)*0.75);
   del_coef=coef25-coeft; 
   del_eng=sum(sum(del_coef.*del_coef));
   del_N=nonzero25-nonzero;
   slopc25=del_eng/del_N;
   
   %---------------------------------------------------------
   cf=band2block_5lev(coef-coeft,8,tanTheta);  er_img=LFP2Inv(cf,8,fL); %<==== LFP
   [er90,non90]=threshold(er_img,T(ia)*0.9);
   slop_90=sum(sum(er90.*er90))/non90;

   [er50,non50]=threshold(er_img,T(ia)*0.5);
   slop_50=sum(sum(er50.*er50))/non50;

   [er25,non25]=threshold(er_img,T(ia)*0.75);
   slop_25=sum(sum(er25.*er25))/non25;
   
   %----------------------------------------------------------
   %cfdy=CFPdyadic1(er_img,tanTheta);  %the PTV
   cfdy=dy79decm_5lev(er_img);
   [cfdy50,ndy50]=threshold(cfdy,T(ia)*0.5);
   qb=dy79recon_5lev(cfdy50);
   %qb=CFPdyadicInv1(cfdy50,tanTheta);   %the PTV
   
   %slop_50dy=sum(sum(cfdy50.*cfdy50))/ndy50;
   slop_50dy=sum(sum(qb.*qb))/ndy50;

   [cfdy25,ndy25]=threshold(cfdy,T(ia)*0.75);
   qb=dy79recon_5lev(cfdy25);
   %qb=CFPdyadicInv1(cfdy25,tanTheta);   %the PTV
   %slop_25dy=sum(sum(cfdy25.*cfdy25))/ndy25;
   slop_25dy=sum(sum(qb.*qb))/ndy25;
      
   fprintf('T=%4.0f  %6.3f %6.3f %6.3f %6.3f %6.3f   max/T=%7.3f\n',T(ia),...
      slop_50dy/slopc50, slop_25dy/slopc25, slop_90/slopc90, slop_50/slopc50, slop_25/slopc25, max(max(abs(er_img)))/T(ia));   
   [Nnon(7,4) Nnon(1,4) ndy25 non90]
end
