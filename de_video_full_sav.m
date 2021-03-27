function qcoef=de_video_full(delta0,bin,qcoef_dum)

load H2ext

qcoef=zeros(1024,1024,96);

wh=8;
fprintf('\n\ndecode L2 ====================================\n')
[qcoef(:,:,81:88),ptr]=de_coef3d_cell(bin{1},wh,delta0);
fprintf('L2a ---------------------------------\n\n')
[qcoef(:,:,57:64),ptr]=de_coef3d_cell(bin{2},wh,delta0);
fprintf('L2b ---------------------------------\n\n')
[qcoef(:,:,33:40),ptr]=de_coef3d_cell(bin{3},wh,delta0);
fprintf('L2c ---------------------------------\n\n')

fprintf('decode L3 ====================================\n')
wh=4;
[qcoef(:,:,17:20),ptr]=de_coef3d_cell(bin{4},wh,delta0);

fprintf('\ndecode L4 ====================================\n')
qcoef(:,:,9:10)=de_coef3dB_cell(bin{5},delta0);

fprintf('\ndecode Ldc5 ====================================\n')
dc=0; qcoef(:,:,5)=de_coef3d_dc5B_cell(bin{6},delta0,routxy,dc);
fprintf('\nL5 done ---------------------------------\n\n')
dc=1; qcoef(:,:,2)=de_coef3d_dc5B_cell(bin{7},delta0,routxy,dc);


%===============================================================================

qcoef(:,:,[81:88]-8) = qcoef_dum{1,1};   %L2a
qcoef(:,:,[57:64]-8) = qcoef_dum{1,2};   %L2b
qcoef(:,:,[33:40]-8) = qcoef_dum{1,3};   %L2c
qcoef(:,:,[17:20]-4) = qcoef_dum{1,4};   %L3
qcoef(:,:,[9:10]-2) = qcoef_dum{1,5};    %L4
qcoef(:,:,5-1) = qcoef_dum{1,6};       %L5
qcoef(:,:,2-1) = qcoef_dum{1,7};       %Ldc

%--------------------------------------------------------

qcoef(:,:,[81:88]+8) = qcoef_dum{2,1};   %L2a
qcoef(:,:,[57:64]+8) = qcoef_dum{2,2};   %L2b
qcoef(:,:,[33:40]+8) = qcoef_dum{2,3};   %L2c
qcoef(:,:,[17:20]+4) = qcoef_dum{2,4};   %L3
qcoef(:,:,[9:10]+2) = qcoef_dum{2,5};    %L4
qcoef(:,:,5+1) = qcoef_dum{2,6};       %L5
qcoef(:,:,2+1) = qcoef_dum{2,7};       %Ldc
