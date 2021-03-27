function [bin,Nbit]=en_video_cell(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc)

load H2ext

bin=cell(1,7);

wh=8;
fprintf('L2 ====================================\n')
[bin{1},N2a]=en_coef3d_cell(L2a,wh,delta0); 
fprintf('L2a bitrate =%7.3f ---------------------------------\n\n', N2a/numel(L2a) );
[bin{2},N2b]=en_coef3d_cell(L2b,wh,delta0);
fprintf('L2b bitrate =%7.3f ---------------------------------\n\n', N2b/numel(L2b) );
[bin{3},N2c]=en_coef3d_cell(L2c,wh,delta0);
fprintf('L2c bitrate =%7.3f ---------------------------------\n\n', N2c/numel(L2c) );

fprintf('L3 ====================================\n')
wh=4;
[bin{4},N3]=en_coef3d_cell(L3,wh,delta0);
fprintf('L3 bitrate =%7.3f ---------------------------------\n\n', N3/numel(L3) );

fprintf('L4 ====================================\n')
[bin{5},N4]=en_coef3dB_cell(L4,delta0);
fprintf('L4 bitrate =%7.3f ---------------------------------\n\n', N4/numel(L4) );

fprintf('Ldc5 ====================================\n')
[bin{6},N5]=en_coef3d_dc5B_cell(L5,delta0,routxy);
fprintf('\nL5 bitrate =%7.3f ---------------------------------\n', N5/numel(L5) );
[bin{7},Ndc]=en_coef3d_dc5B_cell(Ldc,delta0,routxy);
fprintf('\nLdc bitrate =%7.3f ---------------------------------\n', Ndc/numel(Ldc) );

Nbit = N2a +N2b +N2c +N3 +N4 +N5 +Ndc;
