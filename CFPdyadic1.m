function b=CFPdyadic1(a,tanTheta)

sz=size(a);
nbk=sz/4; %nbk the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8;

b=CFP2band(a,tanTheta);
b=block2LowHigh(b);
b(1:tbk(1),1:tbk(2))=CFP2band(b(1:tbk(1),1:tbk(2)),tanTheta);
b(1:tbk(1),1:tbk(2))=block2LowHigh(b(1:tbk(1),1:tbk(2)));

b(1:nbk(1),1:nbk(2))=CFP2band(b(1:nbk(1),1:nbk(2)),tanTheta);
b(1:nbk(1),1:nbk(2))=block2LowHigh(b(1:nbk(1),1:nbk(2)));
tanTheta=1/8; %<================================================== !!!
b(1:hbk(1),1:hbk(2))=CFP2band(b(1:hbk(1),1:hbk(2)),tanTheta);
b(1:hbk(1),1:hbk(2))=block2LowHigh(b(1:hbk(1),1:hbk(2)));
%b(1:qbk(1),1:qbk(2))=CFP2band(b(1:qbk(1),1:qbk(2)),tanTheta);
%b(1:qbk(1),1:qbk(2))=block2LowHigh(b(1:qbk(1),1:qbk(2)));

%b(1:hq(1),1:hq(2))=CFP2band(b(1:hq(1),1:hq(2)),tanTheta);
%b(1:hq(1),1:hq(2))=block2LowHigh(b(1:hq(1),1:hq(2)));
