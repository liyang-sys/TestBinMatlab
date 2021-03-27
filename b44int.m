function [ca, ch, cv, cd]=b44int(x)

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


%x=[1:11; 2:12; 3:13; 4:14; 5:15; 6:16; 7:17; 8:18; 9:19; 10:20; 11:21];
%x=[1:10; 2:11; 3:12; 4:13; 5:14; 6:15; 7:16; 8:17; 9:18; 10:19];

sz=size(x);
xtemp=fliplr(x);
xih=[xtemp(:, sz(2)-4:sz(2)-1)  x  xtemp(:, 2:5)];	
xtemp=flipud(xih);
xint=[xtemp(sz(1)-4:sz(1)-1, :);  xih;  xtemp(2:5, :)];

[a h v d]=dwt2(xint, 'bior4.4');
fsz=size(a);
ca=a(5:fsz(1)-4, 5:fsz(2)-4);
ch=h(5:fsz(1)-4, 5:fsz(2)-4);
cv=v(5:fsz(1)-4, 5:fsz(2)-4);
cd=d(5:fsz(1)-4, 5:fsz(2)-4);
