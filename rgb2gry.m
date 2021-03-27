clc;

[ outarray, H, W, D, ID, scale] = pfmread_op('E:\程序代码\色调映射测试\pfm\memorial_o876.pfm');

[ status, G ] = pfmwrite_gry( outarray, 'E:\程序代码\色调映射测试\pfm\gry\memorial_o876_gry.pfm' );