coef=rstTHDctr1(qcoef,T,delta,0.39*delta,0.46*delta);
%coef=rstVariableDeadZone(qcoef,delta);

%qb=dy79recon(coef);
%qb=dy79recon_5lev(coef);
%qb=dy79recon_3lev(coef);
%qb=dy53recon(coef);      

%qb=CFPdyadicInv1(coef,tanTheta);   %the PTV
   
%coef=band2block(coef,8,tanTheta);  qb=LFP2Inv(coef,8,fL); %<==== LFP
coef=band2block_5lev(coef,8,tanTheta);  qb=LFP2Inv(coef,8,fL); %<==== LFP
%coef=band2block_5lev(coef,12,tanTheta);  qb=LFP2Inv(coef,12,fL); %<==== LFP
   

for ia=N(1)
   for ib=N(2)
      if qb(ia,ib)>255
         qb(ia,ib)=255;
      elseif  qb(ia,ib)<0
         qb(ia,ib)=0;
      end
   end
end

e=qb-a;
e2=e.^2;
e2=sqrt(sum(sum(e2))/(N(1)*N(2)));
SN=20*log10(255/e2);
fprintf('%5.3f\n',SN);

Nnon=sum(sum(abs(sign(qcoef))))
fprintf('\n');


Te=delta;
qe=quanTHD(e,Te,delta);
Nenon=sum(sum(abs(sign(qe))))

Nnn=Nnon+Nenon

er=rstTHDctr1(qe,Te,delta,0.39*delta,0.46*delta);

qbb=qb-er;
e=qbb-a;
e2=e.^2;
e2=sqrt(sum(sum(e2))/(N(1)*N(2)));
SNe=20*log10(255/e2);
fprintf('%5.3f\n',SNe);


ers=conv2(er,[0.25 0.5 0.25]);
ers=conv2(ers,[0.25 0.5 0.25]');
ers=ers(2:N(1)+1, 2:N(2)+1);

qbs=qb-ers;
e=qbs-a;
e2=e.^2;
e2=sqrt(sum(sum(e2))/(N(1)*N(2)));
SNe=20*log10(255/e2);
fprintf('%5.3f\n',SNe);

