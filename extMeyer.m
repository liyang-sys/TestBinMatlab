function H=extMeyer(N,Nconst,para,trans)
%Format: H=extMeyer(N,para,trans)
%Extended Meyer wavelet. For the extended condition, it is actually
%not a Meyer wavelet.

Nv=N-2*Nconst;
H=[ones(1,Nconst) cos(pi/2*smooth(Nv,para,trans)) zeros(1,Nconst)];
