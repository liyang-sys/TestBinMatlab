function [T,h,T2,h2,maxc]=find_T_and_Del(sub,delta0,frac)

%sz=size(sub); N=prod(sz);
N=numel(sub);
delta=delta0*frac;
qcoef=abs(quanTHD(sub,delta,delta));

maxc=max(max(max(qcoef))); %%%%%%%%%%%
if maxc>0
   zn1=sign(qcoef);
   n1t=sum(sum(sum(zn1)));
   n0=N-n1t;

   qcoef1=qcoef-zn1;
   zn2=sign(qcoef1);
   n2t=sum(sum(sum(zn2)));
   n1=n1t-n2t;

   qcoef2=qcoef1-zn2;
   zn3=sign(qcoef2);
   n3t=sum(sum(sum(zn3)));
   n2=n2t-n3t;


   alpha=-log(n1/n0)/frac;
   [T,h]=find_thred_laplace(alpha); 

   if n2>=3
      alph=-log(n2/n1)/frac;
      [T2,h2]=find_thred_laplace(alph);   
   else
      T2=T; h2=h;
   end
else
   T=0; h=0; T2=0; h2=0;
end
