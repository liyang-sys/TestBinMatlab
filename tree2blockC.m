function b=tree2blockC(a,tanTheta)

sz=size(a);
nbk=sz/8; %nbk: the number of blocks,which is also the size of the 3rd level band
tbk=2*nbk;  fbk=4*nbk;  hbk=nbk/2; qbk=nbk/4;

b=a;
%-----------------------------------------------------------------------------
b(1:qbk(1),1:qbk(2))=LowHigh2block(b(1:qbk(1),1:qbk(2)));
b(1:qbk(1),1:qbk(2))=CFP2bandInv(b(1:qbk(1),1:qbk(2)),tanTheta);
b(1:hbk(1),1:hbk(2))=LowHigh2block(b(1:hbk(1),1:hbk(2)));
b(1:hbk(1),1:hbk(2))=CFP2bandInv(b(1:hbk(1),1:hbk(2)),tanTheta);
b(1:nbk(1),1:nbk(2))=LowHigh2block(b(1:nbk(1),1:nbk(2)));
b(1:nbk(1),1:nbk(2))=CFP2bandInv(b(1:nbk(1),1:nbk(2)),tanTheta);


%Re-ordering the coefficients:  ------------------------

%Third level:
a=b;
b(1:2:tbk(1),1:tbk(2))=a(1:nbk(1),1:tbk(2));
b(2:2:tbk(1),1:tbk(2))=a(nbk(1)+1:tbk(1),1:tbk(2));
%now for rows
a=b;
b(1:tbk(1),1:2:tbk(2))=a(1:tbk(1),1:nbk(2));
b(1:tbk(1),2:2:tbk(2))=a(1:tbk(1),nbk(2)+1:tbk(2));


%second level:
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


%first level:
a=b;
b(1:8:sz(1),:)=a(1:4:fbk(1),:);  b(2:8:sz(1),:)=a(2:4:fbk(1),:);
b(3:8:sz(1),:)=a(3:4:fbk(1),:);  b(4:8:sz(1),:)=a(4:4:fbk(1),:);
b(5:8:sz(1),:)=a(fbk(1)+1:4:sz(1),:);  b(6:8:sz(1),:)=a(fbk(1)+2:4:sz(1),:);
b(7:8:sz(1),:)=a(fbk(1)+3:4:sz(1),:);  b(8:8:sz(1),:)=a(fbk(1)+4:4:sz(1),:);
% now for columns
a=b;
b(:,1:8:sz(2))=a(:,1:4:fbk(2));  b(:,2:8:sz(2))=a(:,2:4:fbk(2));
b(:,3:8:sz(2))=a(:,3:4:fbk(2));  b(:,4:8:sz(2))=a(:,4:4:fbk(2));
b(:,5:8:sz(2))=a(:,fbk(2)+1:4:sz(2));  b(:,6:8:sz(2))=a(:,fbk(2)+2:4:sz(2));
b(:,7:8:sz(2))=a(:,fbk(2)+3:4:sz(2));  b(:,8:8:sz(2))=a(:,fbk(2)+4:4:sz(2));
