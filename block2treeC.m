function b=block2treeC(a,tanTheta)

sz=size(a);
nbk=sz/8; %nbk the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4; hq=nbk/8;

%first level:
b=zeros(sz); 
b(1:4:fbk(1),:)=a(1:8:sz(1),:);  b(2:4:fbk(1),:)=a(2:8:sz(1),:);
b(3:4:fbk(1),:)=a(3:8:sz(1),:);  b(4:4:fbk(1),:)=a(4:8:sz(1),:);
b(fbk(1)+1:4:sz(1),:)=a(5:8:sz(1),:);  b(fbk(1)+2:4:sz(1),:)=a(6:8:sz(1),:);
b(fbk(1)+3:4:sz(1),:)=a(7:8:sz(1),:);  b(fbk(1)+4:4:sz(1),:)=a(8:8:sz(1),:);
% now for columns
a=b;
b(:,1:4:fbk(2))=a(:,1:8:sz(2));  b(:,2:4:fbk(2))=a(:,2:8:sz(2));
b(:,3:4:fbk(2))=a(:,3:8:sz(2));  b(:,4:4:fbk(2))=a(:,4:8:sz(2));
b(:,fbk(2)+1:4:sz(2))=a(:,5:8:sz(2));  b(:,fbk(2)+2:4:sz(2))=a(:,6:8:sz(2));
b(:,fbk(2)+3:4:sz(2))=a(:,7:8:sz(2));  b(:,fbk(2)+4:4:sz(2))=a(:,8:8:sz(2));

%second level:
a=b;
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

%Third level:
a=b;
b(1:nbk(1),1:tbk(2))=a(1:2:tbk(1),1:tbk(2));
b(nbk(1)+1:tbk(1),1:tbk(2))=a(2:2:tbk(1),1:tbk(2));
%now for rows
a=b;
b(1:tbk(1),1:nbk(2))=a(1:tbk(1),1:2:tbk(2));
b(1:tbk(1),nbk(2)+1:tbk(2))=a(1:tbk(1),2:2:tbk(2));


%further three level decompositon of the DC band:

%[ba,bv,bh,bd]=b44int(b(1:nbk(1),1:nbk(2)));  b(1:nbk(1),1:nbk(2))=[ba bv; bh bd];
%[ba,bv,bh,bd]=b44int(b(1:hbk(1),1:hbk(2)));  b(1:hbk(1),1:hbk(2))=[ba bv; bh bd];
%[ba,bv,bh,bd]=b44int(b(1:qbk(1),1:qbk(2)));  b(1:qbk(1),1:qbk(2))=[ba bv; bh bd]; fL=0;

%---------------------------------------------------------------------
%b(1:nbk(1),1:nbk(2))=Harr2(b(1:nbk(1),1:nbk(2)));
%b(1:hbk(1),1:hbk(2))=Harr2(b(1:hbk(1),1:hbk(2)));
%b(1:qbk(1),1:qbk(2))=Harr2(b(1:qbk(1),1:qbk(2))); fL=0;

%---------------------------------------------------------------------
b(1:nbk(1),1:nbk(2))=CFP2band(b(1:nbk(1),1:nbk(2)),tanTheta);
b(1:nbk(1),1:nbk(2))=block2LowHigh(b(1:nbk(1),1:nbk(2)));
b(1:hbk(1),1:hbk(2))=CFP2band(b(1:hbk(1),1:hbk(2)),tanTheta);
b(1:hbk(1),1:hbk(2))=block2LowHigh(b(1:hbk(1),1:hbk(2)));
b(1:qbk(1),1:qbk(2))=CFP2band(b(1:qbk(1),1:qbk(2)),tanTheta);
b(1:qbk(1),1:qbk(2))=block2LowHigh(b(1:qbk(1),1:qbk(2)));
