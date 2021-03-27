%HD and UHD images: ===============================================================================================
%a=imread('\image\4k_crowd07111.png');  a=double(a)/257; a=color2Y(a);  a1=uint16(round(a*16));
%a=imread('\image\4k_oldtown01217.png');  a=double(a)/257; a=color2Y(a);  a2=uint16(round(a*16));
%a=imread('\image\4k_ParkJoy15891.png');  a=double(a)/257; a=color2Y(a);  a3=uint16(round(a*16));
%a=imread('\image\JT_Scarf_fm200.png');  a=double(a)/4;  a4=uint16(round(a*16));

%a=imread('\image\birds_fm220.png');  a=double(a)/4;  a1=uint16(round(a*16));
%a=imread('\image\Ducks_fm100.png');  a=double(a)/4;  a2=uint16(round(a*16));
%--------------------------------------------------------------------------------
%a=imread('\image\Beauty.png');  a=double(a)/4;  a1=uint16(round(a*16));
%a=imread('\image\HoneyBee.png');  a=double(a)/4;  a2=uint16(round(a*16));
%a=imread('\image\Kimino_fm1.png');  a=double(a)/4;  a3=uint16(round(a*16));
%a=imread('\image\Kimino_fm220.png');  a=double(a)/4;  a4=uint16(round(a*16));

%x-ray images: =================================================================================================
%a1=imread('med_xray1_896x768_12bit.png');
%a1=imread('med_xray8_736x640_12bit.png');

a1=imread('\image\med_xray2_1536x1536_12bit.png');
a2=imread('\image\med_xray3_1536x1536_12bit.png');
a3=imread('\image\med_xray4_1536x1536_12bit.png');

%a1=imread('\image\med_xray5_512x512_8bit.png'); %already converted: a1=imread('med_xray3_512x512_8bit_original.png'); a1=uint16(round(double(a1)*1.3*16));
%a2=imread('\image\med_xray6_512x512_12bit.png');
%a3=imread('\image\med_xray7_512x512_12bit.png');
%CT images: ------------------------------------------------------------------------------------------------
%a1=imread('CT1.png');
%a2=imread('CT2.png');

%sharp =========================================================================================================
%a=double(imread('DSC_0075acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
%a=double(imread('DSC_0076acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
%a=double(imread('DSC_0113acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a3=uint16(round(a*16));
%a=double(imread('DSC_0184acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));
%a=double(imread('DSC_0415acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a5=uint16(round(a*16));
%a=double(imread('DSC_0436acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a6=uint16(round(a*16));
%a=double(imread('DSC_0438acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a7=uint16(round(a*16));
%a=double(imread('DSC_0455acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a8=uint16(round(a*16));
%a=double(imread('DSC_0461acr2.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a9=uint16(round(a*16));
%quarter images: ----------------------------------------------------------------------------------------------
%a=double(imread('\image\DSC_0075q.png'))/257; a1=uint16(round(a*16));
%a=double(imread('\image\DSC_0113q.png'))/257; a2=uint16(round(a*16));
%a=double(imread('\image\DSC_0184q.png'))/257; a3=uint16(round(a*16));
%a=double(imread('\image\DSC_0415q.png'))/257; a4=uint16(round(a*16));
%a=double(imread('\image\DSC_0436q.png'))/257; a5=uint16(round(a*16));
%a=double(imread('\image\DSC_0438q.png'))/257; a6=uint16(round(a*16));
%a=double(imread('\image\DSC_0455q.png'))/257; a7=uint16(round(a*16));
%a=double(imread('\image\DSC_0461q.png'))/257; a8=uint16(round(a*16));

%Nikon850D ==============================================================================================================
%a=double(imread('DSC_0798.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
    %a=double(imread('DSC_1104.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
%set2 -------------------------------------------------------------------------------------------------------------------
    %a=double(imread('DSC_0630.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
    %a=double(imread('DSC_0783.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
%a=double(imread('DSC_0788.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a3=uint16(round(a*16));
    %a=double(imread('DSC_1256.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));
    %a=double(imread('DSC_1314.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a5=uint16(round(a*16));
%a=double(imread('DSC_1390.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a6=uint16(round(a*16));
    %a=double(imread('DSC_2056.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a7=uint16(round(a*16));
    %a=double(imread('DSC_2061.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a8=uint16(round(a*16));
%a=double(imread('DSC_2118.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a9=uint16(round(a*16));
%Added for QP39F (as only the following 4 images are to be shown) -------------------------------------------------------
%a=double(imread('\image\DSC_0788.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
%a=double(imread('\image\DSC_0798.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
%a=double(imread('\image\DSC_1390.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a3=uint16(round(a*16));
%a=double(imread('\image\DSC_2118.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));

%Fuji ==========================================================================================================
    %a=double(imread('DSCF0044.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
%a=double(imread('DSCF0323.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
    %a=double(imread('DSCF0509.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a3=uint16(round(a*16));
    %a=double(imread('DSCF0705.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));
    %a=double(imread('DSCF0780.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a5=uint16(round(a*16));
%a=double(imread('DSCF3485.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a6=uint16(round(a*16));
%a=double(imread('DSCF5234.tif'))/257; [x,y,z] = color2Y(a); a=double(a1); a(:,:,1)=x'; a(:,:,2)=y'; a(:,:,3)=z'; a7=uint16(round(a*16));
%Fuji set2 -----------------------------------------------------------------------------------------------------
    %a=double(imread('DSCF0430.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
    %a=double(imread('DSCF0528.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
    %a=double(imread('DSCF0652.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a3=uint16(round(a*16));
%a=double(imread('DSCF5253.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));
    %a=double(imread('DSCF5368.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a5=uint16(round(a*16));
    %a=double(imread('DSCF5412.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a6=uint16(round(a*16));
    %a=double(imread('DSCF5424.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a7=uint16(round(a*16));
    %a=double(imread('DSCF9044.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a8=uint16(round(a*16));
%Added for QP39F (as only the following 4 images are to be shown) -----------------------------------------------
%a=double(imread('\image\DSCF0323.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a1=uint16(round(a*16));
%a=double(imread('\image\DSCF3485.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a2=uint16(round(a*16));
%a=double(imread('\image\DSCF5234.tif'))/257; [x,y,z] = color2Y(a); a=double(a1); a(:,:,1)=x'; a(:,:,2)=y'; a(:,:,3)=z'; a3=uint16(round(a*16));
%a=double(imread('\image\DSCF5253.tif'))/257; [a(:,:,1),a(:,:,2),a(:,:,3)] = color2Y(a);  a4=uint16(round(a*16));
    
    
111
[L1,L2,L3]=size(a1);
bitdepth='uint16'; byte=2; zro=zeros([L2 L1]/2);
%outfile='nikon850D_color.yuv';  fid=fopen(outfile,'w+');
%outfile='nikon850D_set2_color.yuv';  fid=fopen(outfile,'w+');
%outfile='nikon_color_acr_set2.yuv';  fid=fopen(outfile,'w+');
%outfile='nikon_color_acr.yuv';  fid=fopen(outfile,'w+');
%outfile='fuji_color_set2.yuv';  fid=fopen(outfile,'w+');
%fwrite(fid, a1(:,:,1)', bitdepth); fwrite(fid, a1(:,:,2)', bitdepth); fwrite(fid, a1(:,:,3)', bitdepth);
%fwrite(fid, a2(:,:,1)', bitdepth); fwrite(fid, a2(:,:,2)', bitdepth); fwrite(fid, a2(:,:,3)', bitdepth);
%fwrite(fid, a3(:,:,1)', bitdepth); fwrite(fid, a3(:,:,2)', bitdepth); fwrite(fid, a3(:,:,3)', bitdepth);
%fwrite(fid, a4(:,:,1)', bitdepth); fwrite(fid, a4(:,:,2)', bitdepth); fwrite(fid, a4(:,:,3)', bitdepth);
%fwrite(fid, a5(:,:,1)', bitdepth); fwrite(fid, a5(:,:,2)', bitdepth); fwrite(fid, a5(:,:,3)', bitdepth); 
%fwrite(fid, a6(:,:,1)', bitdepth); fwrite(fid, a6(:,:,2)', bitdepth); fwrite(fid, a6(:,:,3)', bitdepth);
%fwrite(fid, a7(:,:,1)', bitdepth); fwrite(fid, a7(:,:,2)', bitdepth); fwrite(fid, a7(:,:,3)', bitdepth);
%fwrite(fid, a8(:,:,1)', bitdepth); fwrite(fid, a8(:,:,2)', bitdepth); fwrite(fid, a8(:,:,3)', bitdepth);
%fwrite(fid, a9(:,:,1)', bitdepth); fwrite(fid, a9(:,:,2)', bitdepth); fwrite(fid, a9(:,:,3)', bitdepth);

222
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%fidY=fopen('\image\sharp_q.yuv','w+');
%fidY=fopen('\image\UHDimages.yuv','w+');
fidY=fopen('\image\med_xrays_1536x1536_12bit.yuv','w+');
%fidY=fopen('CT.yuv','w+');
%fidY=fopen('Nikon850D_Y_QP39F.yuv','w+'); %fidU=fopen('fujiU_set2.yuv','w+'); fidV=fopen('fujiV_set2.yuv','w+');
fwrite(fidY, a1(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
fwrite(fidY, a2(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
fwrite(fidY, a3(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a4(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a5(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a6(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a7(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a8(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
%fwrite(fidY, a9(:,:,1)', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);

333
%fwrite(fidU, a1(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a2(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a3(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a4(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a5(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a6(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a7(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a8(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);
%fwrite(fidU, a9(:,:,2)', bitdepth); fwrite(fidU, zro, bitdepth); fwrite(fidU, zro, bitdepth);

444
%fwrite(fidV, a1(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a2(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a3(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a4(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a5(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a6(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a7(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a8(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);
%fwrite(fidV, a9(:,:,3)', bitdepth); fwrite(fidV, zro', bitdepth); fwrite(fidV, zro', bitdepth);

fclose('all');
