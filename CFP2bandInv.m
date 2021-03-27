function a=CFP2bandInv(b,tanTheta)

sz=size(b);

b=CFP2bandRecon(b,tanTheta);
a=CFP2bandRecon(b',tanTheta)';
