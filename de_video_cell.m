function qcoef=de_video_cell(delta0,bin)

load H2ext

qcoef=cell(1,7);

wh=8;
fprintf('\n\ndecode L2 ====================================\n')
[qcoef{1},ptr]=de_coef3d_cell(bin{1},wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[qcoef{2},ptr]=de_coef3d_cell(bin{2},wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[qcoef{3},ptr]=de_coef3d_cell(bin{3},wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[qcoef{4},ptr]=de_coef3d_cell(bin{4},wh,delta0);

fprintf('\ndecode L4 ====================================\n')
[qcoef{5}]=de_coef3dB_cell(bin{5},delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; [qcoef{6}]=de_coef3d_dc5B_cell(bin{6},delta0,routxy,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; [qcoef{7}]=de_coef3d_dc5B_cell(bin{7},delta0,routxy,dc);
