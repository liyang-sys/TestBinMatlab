function b=block2tree4bandC(a,tanTheta)

sz=size(a);
nbk=sz/4; %nbk the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8;

%first level:
b=zeros(sz); 
b(1:2:tbk(1),1:fbk(2))=a(1:4:fbk(1),1:fbk(2));
b(2:2:tbk(1),1:fbk(2))=a(2:4:fbk(1),1:fbk(2));
b(tbk(1)+1:2:fbk(1),1:fbk(2))=a(3:4:fbk(1),1:fbk(2));
b(tbk(1)+2:2:fbk(1),1:fbk(2))=a(4:4:fbk(1),1:fbk(2));
%now for rows
a=b;
b(1:fbk(1),1:2:tbk(2))=a(1:fbk(1),1:4:fbk(2));
b(1:fbk(1),2:2:tbk(2))=a(1:fbk(1),2:4:fbk(2));
b(1:fbk(1),tbk(2)+1:2:fbk(2))=a(1:fbk(1),3:4:fbk(2));
b(1:fbk(1),tbk(2)+2:2:fbk(2))=a(1:fbk(1),4:4:fbk(2));

%Second level:
a=b;
b(1:nbk(1),1:tbk(2))=a(1:2:tbk(1),1:tbk(2));
b(nbk(1)+1:tbk(1),1:tbk(2))=a(2:2:tbk(1),1:tbk(2));
%now for rows
a=b;
b(1:tbk(1),1:nbk(2))=a(1:tbk(1),1:2:tbk(2));
b(1:tbk(1),nbk(2)+1:tbk(2))=a(1:tbk(1),2:2:tbk(2));


%further four level decompositon of the DC band:

%[ba,bv,bh,bd]=b44int(b(1:nbk(1),1:nbk(2)));  b(1:nbk(1),1:nbk(2))=[ba bv; bh bd];
%[ba,bv,bh,bd]=b44int(ba);  b(1:hbk(1),1:hbk(2))=[ba bv; bh bd];
%[ba,bv,bh,bd]=b44int(ba);  b(1:qbk(1),1:qbk(2))=[ba bv; bh bd];
%[ba,bv,bh,bd]=b44int(ba);  b(1:hq(1),1:hq(2))=[ba bv; bh bd];

%---------------------------------------------------------------------
%b(1:nbk(1),1:nbk(2))=Harr2(b(1:nbk(1),1:nbk(2)));
%b(1:hbk(1),1:hbk(2))=Harr2(b(1:hbk(1),1:hbk(2)));
%b(1:qbk(1),1:qbk(2))=Harr2(b(1:qbk(1),1:qbk(2)));

%---------------------------------------------------------------------
b(1:nbk(1),1:nbk(2))=CFP2band(b(1:nbk(1),1:nbk(2)),tanTheta); b(1:nbk(1),1:nbk(2))=block2LowHigh(b(1:nbk(1),1:nbk(2)));
b(1:hbk(1),1:hbk(2))=CFP2band(b(1:hbk(1),1:hbk(2)),tanTheta); b(1:hbk(1),1:hbk(2))=block2LowHigh(b(1:hbk(1),1:hbk(2)));
b(1:qbk(1),1:qbk(2))=CFP2band(b(1:qbk(1),1:qbk(2)),tanTheta); b(1:qbk(1),1:qbk(2))=block2LowHigh(b(1:qbk(1),1:qbk(2)));
b(1:hq(1),1:hq(2))=CFP2band(b(1:hq(1),1:hq(2)),tanTheta); b(1:hq(1),1:hq(2))=block2LowHigh(b(1:hq(1),1:hq(2)));
