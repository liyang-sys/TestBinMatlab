function b=wp2tree(a,M1,M2,M3)
%M1, M2 and M3 are the number of bands for level 1, level 2 and level 3 respectively

N=size(a); hN=N/2; qN=N/4; hqN=N/8;

b=a;

%first level:
if M1==2
   b(1:hN(1),hN(2)+1:N(2))=wp2treeSub2(a(1:hN(1),hN(2)+1:N(2)));
   b(hN(1)+1:N(1),hN(2)+1:N(2))=wp2treeSub2(a(hN(1)+1:N(1),hN(2)+1:N(2)));
   b(hN(1)+1:N(1),1:hN(2))=wp2treeSub2(a(hN(1)+1:N(1),1:hN(2)));
elseif M1==3
   b(1:hN(1),hN(2)+1:N(2))=wp2treeSub3(a(1:hN(1),hN(2)+1:N(2)));
   b(hN(1)+1:N(1),hN(2)+1:N(2))=wp2treeSub3(a(hN(1)+1:N(1),hN(2)+1:N(2)));
   b(hN(1)+1:N(1),1:hN(2))=wp2treeSub3(a(hN(1)+1:N(1),1:hN(2)));
else
   b(1:hN(1),hN(2)+1:N(2))=wp2treeSub(a(1:hN(1),hN(2)+1:N(2)),M1);
   b(hN(1)+1:N(1),hN(2)+1:N(2))=wp2treeSub(a(hN(1)+1:N(1),hN(2)+1:N(2)),M1);
   b(hN(1)+1:N(1),1:hN(2))=wp2treeSub(a(hN(1)+1:N(1),1:hN(2)),M1);
end

%seond level:
b(1:qN(1),qN(2)+1:hN(2))=wp2treeSub(a(1:qN(1),qN(2)+1:hN(2)),M2);
b(qN(1)+1:hN(1),qN(2)+1:hN(2))=wp2treeSub(a(qN(1)+1:hN(1),qN(2)+1:hN(2)),M2);
b(qN(1)+1:hN(1),1:qN(2))=wp2treeSub(a(qN(1)+1:hN(1),1:qN(2)),M2);

%Third level:
if M3>1.1
   b(1:hqN(1),hqN(2)+1:qN(2))=wp2treeSub(a(1:hqN(1),hqN(2)+1:qN(2)),M3);
   b(hqN(1)+1:qN(1),hqN(2)+1:qN(2))=wp2treeSub(a(hqN(1)+1:qN(1),hqN(2)+1:qN(2)),M3);
   b(hqN(1)+1:qN(1),1:hqN(2))=wp2treeSub(a(hqN(1)+1:qN(1),1:hqN(2)),M3);
end
