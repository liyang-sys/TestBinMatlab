function [L2a,L2b,L2c,L3,L4,L5,Ldc]=de_video(bin,delta0,ptr)

load H2ext

wh=8;
fprintf('decode L2 ====================================\n')
[L2a,ptr]=de_coef3d(bin,wh,delta0,ptr);
fprintf('L2a ---------------------------------\n\n')
[L2b,ptr]=de_coef3d(bin,wh,delta0,ptr);
fprintf('L2b ---------------------------------\n\n')
[L2c,ptr]=de_coef3d(bin,wh,delta0,ptr);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[L3,ptr]=de_coef3d(bin,wh,delta0,ptr);

fprintf('\ndecode L4 ====================================\n')
[L4,ptr]=de_coef3dB(bin,delta0,ptr);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; [L5,ptr]=de_coef3d_dc5B(bin,delta0,routxy,dc,ptr);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; [Ldc,ptr]=de_coef3d_dc5B(bin,delta0,routxy,dc,ptr);
