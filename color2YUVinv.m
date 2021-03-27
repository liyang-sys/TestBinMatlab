function rgb=color2YUVinv(Y,U,V)

d1=size(Y,1); d2=size(Y,2); d3=size(Y,3);
rgb=zeros([d1 d2 3 d3]);

rgb(:,:,1,:) = Y            +1.13983*V;
rgb(:,:,2,:) = Y -0.39465*U -0.58060*V;
rgb(:,:,3,:) = Y +2.03211*U       ;
