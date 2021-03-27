function a=CFP2bdInv(b,tanTheta)

b=CFP2bandRe(b,tanTheta);
a=CFP2bandRe(b',tanTheta)';
