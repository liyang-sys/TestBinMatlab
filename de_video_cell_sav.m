function [L2a,L2b,L2c,L3,L4,L5,Ldc]=de_video_cell(delta0,bn2a,bn2b,bn2c,bn3,bn4,bn5,bndc)

load H2ext

wh=8;
fprintf('decode L2 ====================================\n')
[L2a,ptr]=de_coef3d_cell(bn2a,wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[L2b,ptr]=de_coef3d_cell(bn2b,wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[L2c,ptr]=de_coef3d_cell(bn2c,wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[L3,ptr]=de_coef3d_cell(bn3,wh,delta0);

fprintf('\ndecode L4 ====================================\n')
[L4]=de_coef3dB_cell(bn4,delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; [L5]=de_coef3d_dc5B_cell(bn5,delta0,routxy,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; [Ldc]=de_coef3d_dc5B_cell(bndc,delta0,routxy,dc);
