function [Y,Cb,Cr] = color2Y(rgb)
%from Wikipedia

rgb=double(rgb);
R=rgb(:,:,1); G=rgb(:,:,2); B=rgb(:,:,3);
%[max(max(R)) max(max(G)) max(max(B))]

Y = 16 + (65.738*R +129.057*G +25.064*B)/256;
Cb = 128 + (-37.945*R -74.494*G +112.439*B)/256;
Cr = 128 + (112.439*R -94.154*G -18.285*B)/256;
