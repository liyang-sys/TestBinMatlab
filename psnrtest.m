clc;

[ hdr ] = pfmread_op('E:\程序代码\色调映射测试\pfm\gry\memorial_o876_gry.pfm');
% [ hdr0 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q5Q100.pfm');
[ hdr1 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q90.pfm');
[ hdr2 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q80.pfm');
[ hdr3 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q70.pfm');
[ hdr4 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q60.pfm');
[ hdr5 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q50.pfm');
[ hdr6 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q40.pfm');
[ hdr7 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q30.pfm');
[ hdr8 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q20.pfm');
[ hdr9 ] = pfmread_op('E:\程序代码\色调映射测试\reconstruct\re_q10Q10.pfm');

% p0=PSNR(hdr0,hdr);
p1=PSNR(hdr1,hdr);
p2=PSNR(hdr2,hdr);
p3=PSNR(hdr3,hdr);
p4=PSNR(hdr4,hdr);
p5=PSNR(hdr5,hdr);
p6=PSNR(hdr6,hdr);
p7=PSNR(hdr7,hdr);
p8=PSNR(hdr8,hdr);
p9=PSNR(hdr9,hdr);