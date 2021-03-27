function b=tree2block4bandC(a,tanTheta)

sz=size(a);
nbk=sz/4; %nbk: the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8; qq=hq/2;

b=a;
%reconstruction of the DC band:  ----------------------
%b(1:hq(1),1:hq(2))=ib44int(a(1:qq(1),1:qq(2)),a(1:qq(1),qq(2)+1:hq(2)),a(qq(1)+1:hq(1),1:qq(2)),a(qq(1)+1:hq(1),qq(2)+1:hq(2)));
%b(1:qbk(1),1:qbk(2))=ib44int(b(1:hq(1),1:hq(2)),b(1:hq(1),hq(2)+1:qbk(2)),b(hq(1)+1:qbk(1),1:hq(2)),b(hq(1)+1:qbk(1),hq(2)+1:qbk(2)));
%b(1:hbk(1),1:hbk(2))=ib44int(b(1:qbk(1),1:qbk(2)), b(1:qbk(1),qbk(2)+1:hbk(2)),b(qbk(1)+1:hbk(1),1:qbk(2)), b(qbk(1)+1:hbk(1),qbk(2)+1:hbk(2)));
%b(1:nbk(1),1:nbk(2))=ib44int(b(1:hbk(1),1:hbk(2)), b(1:hbk(1),hbk(2)+1:nbk(2)),b(hbk(1)+1:nbk(1),1:hbk(2)), b(hbk(1)+1:nbk(1),hbk(2)+1:nbk(2)));

%-----------------------------------------------------------------------------
%b(1:qbk(1),1:qbk(2))=iHarr2(b(1:qbk(1),1:qbk(2)));
%b(1:hbk(1),1:hbk(2))=iHarr2(b(1:hbk(1),1:hbk(2)));
%b(1:nbk(1),1:nbk(2))=iHarr2(b(1:nbk(1),1:nbk(2)));

%-----------------------------------------------------------------------------
b(1:hq(1),1:hq(2))=LowHigh2block(b(1:hq(1),1:hq(2))); b(1:hq(1),1:hq(2))=CFP2bandInv(b(1:hq(1),1:hq(2)),tanTheta);
b(1:qbk(1),1:qbk(2))=LowHigh2block(b(1:qbk(1),1:qbk(2))); b(1:qbk(1),1:qbk(2))=CFP2bandInv(b(1:qbk(1),1:qbk(2)),tanTheta);
b(1:hbk(1),1:hbk(2))=LowHigh2block(b(1:hbk(1),1:hbk(2))); b(1:hbk(1),1:hbk(2))=CFP2bandInv(b(1:hbk(1),1:hbk(2)),tanTheta);
b(1:nbk(1),1:nbk(2))=LowHigh2block(b(1:nbk(1),1:nbk(2))); b(1:nbk(1),1:nbk(2))=CFP2bandInv(b(1:nbk(1),1:nbk(2)),tanTheta);


%Re-ordering the coefficients:  ------------------------

%Second level:
a=b;
b(1:2:tbk(1),1:tbk(2))=a(1:nbk(1),1:tbk(2));
b(2:2:tbk(1),1:tbk(2))=a(nbk(1)+1:tbk(1),1:tbk(2));
%now for rows
a=b;
b(1:tbk(1),1:2:tbk(2))=a(1:tbk(1),1:nbk(2));
b(1:tbk(1),2:2:tbk(2))=a(1:tbk(1),nbk(2)+1:tbk(2));


%First level:
a=b;
b(1:4:fbk(1),1:fbk(2))=a(1:2:tbk(1),1:fbk(2));
b(2:4:fbk(1),1:fbk(2))=a(2:2:tbk(1),1:fbk(2));
b(3:4:fbk(1),1:fbk(2))=a(tbk(1)+1:2:fbk(1),1:fbk(2));
b(4:4:fbk(1),1:fbk(2))=a(tbk(1)+2:2:fbk(1),1:fbk(2));
%now for rows
a=b;
b(1:fbk(1),1:4:fbk(2))=a(1:fbk(1),1:2:tbk(2));
b(1:fbk(1),2:4:fbk(2))=a(1:fbk(1),2:2:tbk(2));
b(1:fbk(1),3:4:fbk(2))=a(1:fbk(1),tbk(2)+1:2:fbk(2));
b(1:fbk(1),4:4:fbk(2))=a(1:fbk(1),tbk(2)+2:2:fbk(2));
