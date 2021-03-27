function [bn2a,bn2b,bn2c,bn3,bn4,bn5,bndc,Nbit]=en_video(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc)

load H2ext

wh=8;
fprintf('L2 ====================================\n')
[bn2a,N2a]=en_coef3d_cell(L2a,wh,delta0); 
fprintf('L2a bitrate =%6.2f ---------------------------------\n\n', N2a/numel(L2a) );
[bn2b,N2b]=en_coef3d_cell(L2b,wh,delta0);
fprintf('L2b bitrate =%6.2f ---------------------------------\n\n', N2b/numel(L2b) );
[bn2c,N2c]=en_coef3d_cell(L2c,wh,delta0);
fprintf('L2c bitrate =%6.2f ---------------------------------\n\n', N2c/numel(L2c) );

fprintf('L3 ====================================\n')
wh=4;
[bn3,N3]=en_coef3d_cell(L3,wh,delta0);
fprintf('L3 bitrate =%6.2f ---------------------------------\n\n', N3/numel(L3) );

fprintf('L4 ====================================\n')
[bn4,N4]=en_coef3dB_cell(L4,delta0);
fprintf('L4 bitrate =%6.2f ---------------------------------\n\n', N4/numel(L4) );

fprintf('Ldc5 ====================================\n')
[bn5,N5]=en_coef3d_dc5B_cell(L5,delta0,routxy);
fprintf('\nL5 bitrate =%6.2f ---------------------------------\n', N5/numel(L5) );
[bndc,Ndc]=en_coef3d_dc5B_cell(Ldc,delta0,routxy);
fprintf('\nLdc bitrate =%6.2f ---------------------------------\n', Ndc/numel(Ldc) );

Nbit = N2a +N2b +N2c +N3 +N4 +N5 +Ndc;
