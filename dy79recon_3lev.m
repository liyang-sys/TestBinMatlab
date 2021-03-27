function a=dy79recon_3lev(coef)

N=size(coef); hN=N/2; qN=N/4; hqN=N/8; qqN=N/16; hqqN=N/32; qqqN=N/64;

coef=double(coef);

qbh=coef(1:hN(1), hN(2)+1:N(2));
qbv=coef(hN(1)+1:N(1), 1:hN(2));
qbd=coef(hN(1)+1:N(1), hN(2)+1:N(2));

qbh2=coef(1:qN(1), qN(2)+1:hN(2));
qbv2=coef(qN(1)+1:hN(1), 1:qN(2));
qbd2=coef(qN(1)+1:hN(1), qN(2)+1:hN(2));

qba3=coef(1:hqN(1), 1:hqN(2));
qbh3=coef(1:hqN(1), hqN(2)+1:qN(2));
qbv3=coef(hqN(1)+1:qN(1), 1:hqN(2));
qbd3=coef(hqN(1)+1:qN(1), hqN(2)+1:qN(2));


qbaa2=ib44int(qba3, qbv3, qbh3, qbd3);
qbaa=ib44int(qbaa2, qbv2, qbh2, qbd2);
a=ib44int(qbaa, qbv, qbh, qbd);
