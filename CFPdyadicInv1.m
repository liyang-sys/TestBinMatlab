function b=CFPdyadicInv1(a,tanTheta)

t0=tanTheta; tanTheta=1/8; %<====================================== !!!

sz=size(a);
nbk=sz/4; %nbk: the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8;

b=a;
%b(1:hq(1),1:hq(2))=LowHigh2block(b(1:hq(1),1:hq(2)));
b(1:hq(1),1:hq(2))=CFP2bandInv(b(1:hq(1),1:hq(2)),tanTheta);

%b(1:qbk(1),1:qbk(2))=LowHigh2block(b(1:qbk(1),1:qbk(2)));
b(1:qbk(1),1:qbk(2))=CFP2bandInv(b(1:qbk(1),1:qbk(2)),tanTheta);
%b(1:hbk(1),1:hbk(2))=LowHigh2block(b(1:hbk(1),1:hbk(2)));
b(1:hbk(1),1:hbk(2))=CFP2bandInv(b(1:hbk(1),1:hbk(2)),tanTheta);
tanTheta=t0; %<================================================== !!!
%b(1:nbk(1),1:nbk(2))=LowHigh2block(b(1:nbk(1),1:nbk(2)));
b(1:nbk(1),1:nbk(2))=CFP2bandInv(b(1:nbk(1),1:nbk(2)),tanTheta);

%b(1:tbk(1),1:tbk(2))=LowHigh2block(b(1:tbk(1),1:tbk(2)));
b(1:tbk(1),1:tbk(2))=CFP2bandInv(b(1:tbk(1),1:tbk(2)),tanTheta);
%b=LowHigh2block(b);
b=CFP2bandInv(b,tanTheta);
