nframe=15;  frame=1; 
fid=zeros(1,nframe);
infile='D:\video4k\JT_4kvideos\BundNightscape.yuv'; fid(1)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\ConstructionField.yuv'; fid(2)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Fountains.yuv'; fid(3)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\CampFireParty.yuv'; fid(4)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Library.yuv'; fid(5)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Marathon.yuv'; fid(6)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\ResidentialBuilding.yuv'; fid(7)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Runners.yuv'; fid(8)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\RushHour.yuv'; fid(9)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Scarf.yuv'; fid(10)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\TallBuildings.yuv'; fid(11)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\TrafficFlow.yuv'; fid(12)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Traffic_and_Building.yuv'; fid(13)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\TreeShade.yuv'; fid(14)=fopen(infile,'r');
infile='D:\video4k\JT_4kvideos\Wood.yuv'; fid(15)=fopen(infile,'r');

infile='JT_frame1Color.yuv'; fidc=fopen(infile,'w+');
fidY=fopen('JT_frame1Y.yuv','w+'); fidu=fopen('JT_frame1U.yuv','w+'); fidv=fopen('JT_frame1V.yuv','w+');

L1=2160; L2=3840; 
bitdepth='uint16'; byte=2; zro=zeros([L2 L1]/2);

for ia=1:nframe
    ia
    fseek(fid(ia),(frame-1)*L2*L1*6,'bof'); 
    b=fread(fid(ia), [L2,L1],bitdepth)';   u=fread(fid(ia), [L2,L1],bitdepth)';   v=fread(fid(ia), [L2,L1],bitdepth)';
    
    imwrite(uint16(b), ['JT' num2str(ia) 'Y.png']); 
    imwrite(uint16(u), ['JT' num2str(ia) 'U.png']); 
    imwrite(uint16(v), ['JT' num2str(ia) 'V.png']); 
    fwrite(fidc, b', bitdepth); fwrite(fidc, u', bitdepth); fwrite(fidc, v', bitdepth);
    fwrite(fidY, b', bitdepth); fwrite(fidY, zro, bitdepth); fwrite(fidY, zro, bitdepth);
    fwrite(fidu, u', bitdepth); fwrite(fidu, zro, bitdepth); fwrite(fidu, zro, bitdepth);
    fwrite(fidv, v', bitdepth); fwrite(fidv, zro, bitdepth); fwrite(fidv, zro, bitdepth);
end
fclose('all');
