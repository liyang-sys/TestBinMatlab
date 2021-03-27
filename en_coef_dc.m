function binary=en_coef_dc(subcoef,N)

binary=SFcode(N(1)/8,1024);  binary=[binary SFcode(N(2)/8,1024)];

fprintf('\nEncoding level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   subband=subcoef{1,ia};
   if max(max(abs(subband)))>0
      bin=en_subband_L1(subband);
      binary=[binary 1 bin];
   else
      binary=[binary 0];
   end
   %len1=length(binary) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Encoding level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bin=en_subband_L2(subcoef{2,ia});
   binary=[binary bin];
   %len2=length(binary) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Encoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bin=en_subband_L3(subcoef{3,ia},0);
   binary=[binary bin];
end

fprintf('Encoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bin=en_subband_L4(subcoef{4,ia},0);
   binary=[binary bin];
end

%fprintf('Encoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bin=en_subband_L5(subcoef{5,ia},0);
   binary=[binary bin];
end

%fprintf('Encoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bin=en_subband_L5(subcoef{6,ia},0);
   binary=[binary bin];
end

%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
maxc=max(max(subcoef{7,1}));
for ia=1:N(1)/64
   for ib=1:N(2)/64
      binary=[binary SFcode(subcoef{7,1}(ia,ib)+1,maxc)];
   end
end
