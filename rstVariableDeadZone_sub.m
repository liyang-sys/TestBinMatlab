function [subr,T]=rstVariableDeadZone_sub(qsub,delta)

N=size(qsub);

qmaxval=max(max(abs(qsub)));
if qmaxval==0
   subr=zeros(N);
elseif qmaxval==1
   T=delta; 
   subr=rstTHDctr1(qsub,T,delta,0.3*delta,0.4*delta);
elseif qmaxval==2
   T=0.95*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.32*delta,0.38*delta);
elseif qmaxval==3
   T=0.9*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.37*delta,0.44*delta);
elseif qmaxval<=6
   T=0.85*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.37*delta,0.44*delta);
elseif qmaxval<=12
   T=0.8*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.37*delta,0.44*delta);
elseif qmaxval<=20
   T=0.75*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.37*delta,0.45*delta);
elseif qmaxval<=39
   T=0.7*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.38*delta,0.45*delta);
elseif qmaxval<=76
   T=0.65*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.39*delta,0.46*delta);
elseif qmaxval<=150
   T=0.6*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.43*delta,0.48*delta);
elseif qmaxval<=300
   T=0.55*delta; 
   subr=rstTHDctr1(qsub,T,delta,0.5*delta,0.5*delta);
else
   T=0.5*delta;
   subr=rstTHDctr1(qsub,T,delta,0.5*delta,0.5*delta);
end
