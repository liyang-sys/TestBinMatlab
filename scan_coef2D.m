function ssub=scan_coef2D(subcoef,N,hh)

load H2ext
%binary=SFcode(N(1)/8,1024);  binary=[binary SFcode(N(2)/8,1024)];
n=N/8;

ssub=cell(7,4);
if N(1)~=N(2)
   fprintf('\nScanning level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   hn=4*n;
   ssub{1,1}=[scan_zigzag(subcoef{1,1}(1:n(1),:), hh) scan_zigzag((subcoef{1,2}(:,1:n(2)))', hh)];
   ssub{1,2}=scan_zigzag(subcoef{1,1}(n(1)+1:hn(1),:), hh);
   ssub{1,3}=scan_zigzag((subcoef{1,2}(:,n(2)+1:hn(2)))', hh);
   ssub{1,4}=scan_zigzag(subcoef{1,3}, hh);

   fprintf('Scanning level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   hn=2*n;
   ssub{2,1}=[scan_zigzag(subcoef{2,1}(1:n(1),:), hh) scan_zigzag((subcoef{2,2}(:,1:n(2)))', hh)];
   ssub{2,2}=[scan_zigzag(subcoef{2,1}(n(1)+1:hn(1),:), hh) scan_zigzag((subcoef{2,2}(:,n(2)+1:hn(2)))', hh)];
   ssub{2,3}=scan_zigzag(subcoef{2,3}, hh);
   
   fprintf('Scanning level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{3,1}=scan_zigzag(subcoef{3,1}, hh);
   ssub{3,2}=scan_zigzag(subcoef{3,2}', hh);
   ssub{3,3}=scan_zigzag(subcoef{3,3}, hh);
   
   fprintf('Scanning level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{4,1}=scan_zigzag(subcoef{4,1}, hh);
   ssub{4,2}=scan_zigzag(subcoef{4,2}', hh);
   ssub{4,3}=scan_zigzag(subcoef{4,3}, hh);

   %fprintf('Scanning level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{5,1}=[scan_zigzag(subcoef{5,1}, hh) scan_zigzag(subcoef{5,2}', hh) scan_zigzag(subcoef{5,3}, hh)];

   %fprintf('Scanning level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{6,1}=[scan_zigzag(subcoef{6,1}, hh) scan_zigzag(subcoef{6,2}', hh) scan_zigzag(subcoef{6,3}, hh)];

   %fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
   ssub{7,1}=scan_zigzag(subcoef{7,1}, hh);
else
   %fprintf('\nScanning level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   hn=4*n; len=numel(subcoef{1,1});
   ssub{1,1}=[scan_zigzag(subcoef{1,1}(1:n(1),:), hh) scan_zigzag((subcoef{1,2}(:,1:n(2)))', hh)];
   
   ssub{1,2}=scan_zigzag(subcoef{1,1}(n(1)+1:3*n(1),:), hh);
   
   tem=[subcoef{1,2}(:,n(2)+1:hn(2))  (subcoef{1,1}(3*n(1)+1:hn(1),:))'];
   stem=zeros(1,len);
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{1,3}=stem;
   
   tem=subcoef{1,3};
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{1,4}=stem;

   %fprintf('Scanning level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   hn=2*n; len=numel(subcoef{2,1});
   ssub{2,1}=[scan_zigzag(subcoef{2,1}(1:n(1),:), hh) scan_zigzag((subcoef{2,2}(:,1:n(2)))', hh)];

   tem=[subcoef{1,2}(:,n(2)+1:hn(2))  (subcoef{1,1}(n(1)+1:hn(1),:))'];
   stem=zeros(1,len);
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{2,2}=stem;
   
   tem=subcoef{2,3};
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{2,3}=stem;

   %fprintf('Scanning level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{3,1}=scan_zigzag(subcoef{3,1}, hh);
   ssub{3,2}=scan_zigzag(subcoef{3,2}', hh);
   
   tem=subcoef{3,3}; len=numel(tem);
   stem=zeros(1,len);
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{3,3}=stem;
   
   %fprintf('Scanning level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{4,1}=scan_zigzag(subcoef{4,1}, hh);
   ssub{4,2}=scan_zigzag(subcoef{4,2}', hh);
   
   tem=subcoef{4,3}; len=numel(tem);
   stem=zeros(1,len);
   for ia=1:len,   stem(ia)=tem(xx(ia),yy(ia));   end
   ssub{4,3}=stem;

   %fprintf('Scanning level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{5,1}=[scan_zigzag(subcoef{5,1}, hh) scan_zigzag(subcoef{5,2}', hh) scan_zigzag(subcoef{5,3}, hh)];

   %fprintf('Scanning level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
   ssub{6,1}=[scan_zigzag(subcoef{6,1}, hh) scan_zigzag(subcoef{6,2}', hh) scan_zigzag(subcoef{6,3}, hh)];

   %fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
   ssub{7,1}=scan_zigzag(subcoef{7,1}, hh);
end
