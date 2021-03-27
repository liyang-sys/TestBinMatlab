function binary=en_coef_individual_subs(subcoef,N,delta,coef)

load H2ext
subsz=N/8;
binary=SFcode(subsz(1),2048);  binary=[binary SFcode(subsz(2),2048)];

fprintf('\nEncoding uniform subs: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:8
   for ib=2:8
      row = (ia-1)*subsz(1)+1 : ia*subsz(1);    col = (ib-1)*subsz(2)+1 : ib*subsz(2);
      sub=coef(row,col);
      [bin,xx,qcf]=en_sub2d(sub,routxy,delta);
      binary=[binary bin];
   end
end

ib=1;
col = (ib-1)*subsz(2)+1 : ib*subsz(2);
for ia=2:8
   row = (ia-1)*subsz(1)+1 : ia*subsz(1); 
   sub=coef(row,col);
   [bin,xx,qcf]=en_sub2d(sub,routxy,delta);
   binary=[binary bin];
end



fprintf('Encoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [bin,xx,qcf]=en_sub2d(subcoef{4,ia},routxy,delta);
   binary=[binary bin];
end

%fprintf('Encoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [bin,xx,qcf]=en_sub2d(subcoef{5,ia},routxy,delta);
  % binary=[binary bin];
%end
[bin,xx,qcf]=en_sub2d([subcoef{5,1} subcoef{5,2} subcoef{5,3}],routxy,delta);
binary=[binary bin];

%fprintf('Encoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [bin,xx,qcf]=en_sub2d(subcoef{6,ia},routxy,delta);
  % binary=[binary bin];
%end
[bin,xx,qcf]=en_sub2d([subcoef{6,1} subcoef{6,2} subcoef{6,3}],routxy,delta);
binary=[binary bin];


%fprintf('Encoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
maxc=ceil(255 * 2^6 /delta)+1;
for ia=1:N(1)/64
   for ib=1:N(2)/64
      binary=[binary SFcode(round(subcoef{7,1}(ia,ib)/delta)+1,maxc)];
   end
end
