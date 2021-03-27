function [qsub,T]=quantVariableDeadZone_sub(sub,delta)

maxval=max(max(abs(sub)));
qmaxval=quanTHD(maxval,delta,delta);

if qmaxval==0
   T=delta; qsub=quanTHD(sub,T,delta);
elseif qmaxval==1
   T=delta; qsub=quanTHD(sub,T,delta);
   if sum(sum(abs(qsub)))<7
      qsub=zeros(size(sub));
   end
elseif qmaxval==2
   if quanTHD(maxval,0.95*delta,delta)==2
      T=0.95*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.9*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval==3
   if quanTHD(maxval,0.9*delta,delta)==3
      T=0.9*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.85*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=6
   if quanTHD(maxval,0.85*delta,delta)<=6
      T=0.85*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.8*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=12
   if quanTHD(maxval,0.8*delta,delta)<=12
      T=0.8*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.75*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=20
   if quanTHD(maxval,0.75*delta,delta)<=20
      T=0.75*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.7*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=39
   if quanTHD(maxval,0.7*delta,delta)<=39
      T=0.7*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.65*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=76
   if quanTHD(maxval,0.65*delta,delta)<=76
      T=0.65*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.6*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=150
   if quanTHD(maxval,0.6*delta,delta)<=150
      T=0.6*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.55*delta; qsub=quanTHD(sub,T,delta);
   end
elseif qmaxval<=300
   if quanTHD(maxval,0.55*delta,delta)<=300
      T=0.55*delta; qsub=quanTHD(sub,T,delta);
   else
      T=0.5*delta; qsub=quanTHD(sub,T,delta);
   end
else
   T=0.5*delta; qsub=quanTHD(sub,T,delta);
end
