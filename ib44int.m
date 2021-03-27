function a=ib44int(ca, ch, cv, cd)

% For bior4.4, there are 9/7 coificients. Add 4 points at the start,
% and at the end, since the filter is symmetric. 

% To do symmetrical reflection, for decomposition: odd interpolation 
% should be used at both the start and the end because both filters (low 
% and high) have odd number of taps. For reconstruction, it is much more 
% complicated. For this particular case, 4 points are added for 
% decomposition, and the decom-low filter has 9 taps, and the decom-high 
% has 7 taps. Therefore, say 1-d, low band should be odd interp at the 
% start and even at the end. And high band should be even at the start
% and odd at the end!!!! For 2-d, it is very similar. See the gragh in
% Matlab record.

sz=size(ca);
sx1=sz(1)-1; sy1=sz(2)-1;
sx3=sz(1)-3; sy3=sz(2)-3;
sx4=sz(1)-4; sy4=sz(2)-4;

catemp=fliplr(ca);
caih=[catemp(:, sy4:sy1)  ca  catemp(:, 1:4)];	%odd-start, even-end 
catemp=flipud(caih);
caint=[catemp(sx4:sx1, :);  caih;  catemp(1:4, :)];	%odd, even

chtemp=fliplr(ch);
chih=[chtemp(:, sy4:sy1)  ch  chtemp(:, 1:4)];	%odd, even
chtemp=flipud(chih);
chint=[chtemp(sx3:sz(1), :);  chih;  chtemp(2:5, :)]; %even, odd

cvtemp=fliplr(cv);
cvih=[cvtemp(:, sy3:sz(2))  cv  cvtemp(:, 2:5)];	%even, odd
cvtemp=flipud(cvih);
cvint=[cvtemp(sx4:sx1, :);  cvih;  cvtemp(1:4, :)];	%odd, even

cdtemp=fliplr(cd);
cdih=[cdtemp(:, sy3:sz(2))  cd  cdtemp(:, 2:5)];	%even, odd
cdtemp=flipud(cdih);
cdint=[cdtemp(sx3:sz(1), :);  cdih;  cdtemp(2:5, :)];	%even, odd

atemp=idwt2(caint, chint, cvint, cdint, 'bior4.4');

tsz=2*sz;
a=atemp(5:4+tsz(1), 5:4+tsz(2));
