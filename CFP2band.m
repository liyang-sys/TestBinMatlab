function b=CFP2band(a,tanTheta)

sz=size(a);

b=CFP2bandDecom(a,tanTheta);
b=CFP2bandDecom(b',tanTheta)';

