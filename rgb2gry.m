clc;

[ outarray, H, W, D, ID, scale] = pfmread_op('E:\�������\ɫ��ӳ�����\pfm\memorial_o876.pfm');

[ status, G ] = pfmwrite_gry( outarray, 'E:\�������\ɫ��ӳ�����\pfm\gry\memorial_o876_gry.pfm' );