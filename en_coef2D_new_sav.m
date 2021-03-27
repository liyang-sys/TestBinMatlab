function binary=en_coef2D_new(subcoef,N,delta)

load H2ext
binary=SFcode(N(1)/8,1024);  binary=[binary SFcode(N(2)/8,1024)];

fprintf('\nEncoding level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [bin,xx,qcf]=en_sub2d(subcoef{1,ia},routxy,delta);
   binary=[binary bin];
   length(bin)
end
%len=length(binary)
fprintf('Encoding level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [bin,xx,qcf]=en_sub2d(subcoef{2,ia},routxy,delta);
   binary=[binary bin];
end
%len=length(binary)-len

fprintf('Encoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [bin,xx,qcf]=en_sub2d(subcoef{3,ia},routxy,delta);
   binary=[binary bin];
end
%length(bin)

fprintf('Encoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [bin,xx,qcf]=en_sub2d(subcoef{4,ia},routxy,delta);
   binary=[binary bin];
end
%length(bin)

%fprintf('Encoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [bin,xx,qcf]=en_sub2d(subcoef{5,ia},routxy,delta);
  % binary=[binary bin];
%end
[bin,xx,qcf]=en_sub2d([subcoef{5,1} subcoef{5,2} subcoef{5,3}],routxy,delta);
binary=[binary bin];
%length(bin)

%fprintf('Encoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [bin,xx,qcf]=en_sub2d(subcoef{6,ia},routxy,delta);
  % binary=[binary bin];
%end
[bin,xx,qcf]=en_sub2d([subcoef{6,1} subcoef{6,2} subcoef{6,3}],routxy,delta);
binary=[binary bin];
%length(bin)



%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
%maxc=ceil(255 * 2^6 /delta)+1; <==== changed below, but why? non-orthogonal?
maxc=255 * 2^6 /delta; maxc=round(1.1*maxc);
for ia=1:N(1)/64
   for ib=1:N(2)/64
      binary=[binary SFcode(round(subcoef{7,1}(ia,ib)/delta)+1,maxc)];
   end
end
