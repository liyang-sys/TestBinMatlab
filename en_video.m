function bin=en_video(delta0,L2a,L2b,L2c,L3,L4,L5,Ldc)

load H2ext

wh=8;
fprintf('L2 ====================================\n')
bin=en_coef3d(L2a,wh,delta0); 
fprintf('L2a bitrate =%6.2f ---------------------------------\n\n', length(bin)/numel(L2a) );
bn=en_coef3d(L2b,wh,delta0); bin=[bin bn];
fprintf('L2b bitrate =%6.2f ---------------------------------\n\n', length(bn)/numel(L2b) );
bn=en_coef3d(L2c,wh,delta0); bin=[bin bn];
fprintf('L2c bitrate =%6.2f ---------------------------------\n\n', length(bn)/numel(L2c) );

fprintf('L3 ====================================\n')
wh=4;
bn=en_coef3d(L3,wh,delta0); bin=[bin bn];
fprintf('L3 bitrate =%6.2f ---------------------------------\n\n', length(bn)/numel(L3) );

fprintf('L4 ====================================\n')
bn=en_coef3dB(L4,delta0); bin=[bin bn];
fprintf('L4 bitrate =%6.2f ---------------------------------\n\n', length(bn)/numel(L4) );

fprintf('Ldc5 ====================================\n')
[bn]=en_coef3d_dc5B(L5,delta0,routxy); bin=[bin bn];
fprintf('\nL5 bitrate =%6.2f ---------------------------------\n', length(bn)/numel(L5) );
[bn]=en_coef3d_dc5B(Ldc,delta0,routxy); bin=[bin bn];
fprintf('\nLdc bitrate =%6.2f ---------------------------------\n', length(bn)/numel(Ldc) );

