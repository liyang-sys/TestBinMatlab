function qcoef=de_video_full(delta0,bin,bin1,bin2,h0,w0)

load H2ext
qcoef=zeros(h0,w0,96);
wh=8;
fprintf('\n\ndecode L2 ====================================\n')
[qcoef(:,:,81:88),ptr]=de_coef3d_cell(bin{1},h0,w0,wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[qcoef(:,:,57:64),ptr]=de_coef3d_cell(bin{2},h0,w0,wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[qcoef(:,:,33:40),ptr]=de_coef3d_cell(bin{3},h0,w0,wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[qcoef(:,:,17:20),ptr]=de_coef3d_cell(bin{4},h0,w0,wh,delta0);

fprintf('\ndecode L4 ====================================\n')
qcoef(:,:,9:10)=de_coef3dB_cell(bin{5},h0,w0,delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; qcoef(:,:,5)=de_coef3d_dc5B_cell(bin{6},delta0,h0,w0,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; qcoef(:,:,2)=de_coef3d_dc5B_cell(bin{7},delta0,h0,w0,dc);


%===============================================================================
wh=8;
fprintf('\n\ndecode L2 ====================================\n')
[qcoef(:,:,[81:88]-8),ptr]=de_coef3d_cell(bin1{1},h0,w0,wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[qcoef(:,:,[57:64]-8),ptr]=de_coef3d_cell(bin1{2},h0,w0,wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[qcoef(:,:,[33:40]-8),ptr]=de_coef3d_cell(bin1{3},h0,w0,wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[qcoef(:,:,[17:20]-4),ptr]=de_coef3d_cell(bin1{4},h0,w0,wh,delta0);

fprintf('\ndecode L4 ====================================\n')
qcoef(:,:,[9:10]-2)=de_coef3dB_cell(bin1{5},h0,w0,delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; qcoef(:,:,5-1)=de_coef3d_dc5B_cell(bin1{6},delta0,h0,w0,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; qcoef(:,:,2-1)=de_coef3d_dc5B_cell(bin1{7},delta0,h0,w0,dc);

%===============================================================================
wh=8;
fprintf('\n\ndecode L2 ====================================\n')
[qcoef(:,:,[81:88]+8),ptr]=de_coef3d_cell(bin2{1},h0,w0,wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[qcoef(:,:,[57:64]+8),ptr]=de_coef3d_cell(bin2{2},h0,w0,wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[qcoef(:,:,[33:40]+8),ptr]=de_coef3d_cell(bin2{3},h0,w0,wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[qcoef(:,:,[17:20]+4),ptr]=de_coef3d_cell(bin2{4},h0,w0,wh,delta0);

fprintf('\ndecode L4 ====================================\n')
qcoef(:,:,[9:10]+2)=de_coef3dB_cell(bin2{5},h0,w0,delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; qcoef(:,:,5+1)=de_coef3d_dc5B_cell(bin2{6},delta0,h0,w0,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; qcoef(:,:,2+1)=de_coef3d_dc5B_cell(bin2{7},delta0,h0,w0,dc);

