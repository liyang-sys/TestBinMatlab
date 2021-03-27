%a=read_bin_8bit('\signif\basketball.bin');
%a=read_bin_8bit('\signif\peopleST.bin');
%a=read_bin_16bit('\signif\seeking.bin'); a=double(a)/4;
%a=read_bin_16bit('\signif\traffic.bin'); a=double(a)/16;
%a=read_bin_8bit('\signif\Johnny.bin');

%load \signif\BQTerrace_96frames
%load \signif\ParkScene_96frames; a=a/4;
%load \signif\Kimono_96frames; a=a/4;

a=read_bin_16bit('\signif\birds.bin'); a=double(a);
%load \signif\cactus_96frames
%load \signif\OldTownCross_96frames;  %a=a/4;

a=a(:,:,33);

%save birds33 a
