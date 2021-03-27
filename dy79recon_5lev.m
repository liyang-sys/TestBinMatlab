function a=dy79recon_5lev(coef)

N=size(coef); hN=N/2; qN=N/4; hqN=N/8; qqN=N/16; hqqN=N/32; qqqN=N/64;

coef=double(coef);

qbh=coef(1:hN(1), hN(2)+1:N(2));
qbv=coef(hN(1)+1:N(1), 1:hN(2));
qbd=coef(hN(1)+1:N(1), hN(2)+1:N(2));

qbh2=coef(1:qN(1), qN(2)+1:hN(2));
qbv2=coef(qN(1)+1:hN(1), 1:qN(2));
qbd2=coef(qN(1)+1:hN(1), qN(2)+1:hN(2));

qbh3=coef(1:hqN(1), hqN(2)+1:qN(2));
qbv3=coef(hqN(1)+1:qN(1), 1:hqN(2));
qbd3=coef(hqN(1)+1:qN(1), hqN(2)+1:qN(2));

qbh4=coef(1:qqN(1), qqN(2)+1:hqN(2));
qbv4=coef(qqN(1)+1:hqN(1), 1:qqN(2));
qbd4=coef(qqN(1)+1:hqN(1), qqN(2)+1:hqN(2));

qba5=coef(1:hqqN(1), 1:hqqN(2));
qbh5=coef(1:hqqN(1), hqqN(2)+1:qqN(2));
qbv5=coef(hqqN(1)+1:qqN(1), 1:hqqN(2));
qbd5=coef(hqqN(1)+1:qqN(1), hqqN(2)+1:qqN(2));

%qba6=coef(1:qqqN(1), 1:qqqN(2));
%qbh6=coef(1:qqqN(1), qqqN(2)+1:hqqN(2));
%qbv6=coef(qqqN(1)+1:hqqN(1), 1:qqqN(2));
%qbd6=coef(qqqN(1)+1:hqqN(1), qqqN(2)+1:hqqN(2));

%qbaa5=ib44int(qba6, qbv6, qbh6, qbd6); qbaa4=ib44int(qbaa5, qbv5, qbh5, qbd5);
qbaa4=ib44int(qba5, qbv5, qbh5, qbd5);
qbaa3=ib44int(qbaa4, qbv4, qbh4, qbd4);
qbaa2=ib44int(qbaa3, qbv3, qbh3, qbd3);
qbaa=ib44int(qbaa2, qbv2, qbh2, qbd2);
a=ib44int(qbaa, qbv, qbh, qbd);
