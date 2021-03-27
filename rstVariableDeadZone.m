function coef=rstVariableDeadZone(qcoef,delta)

N=size(qcoef);
coef=zeros(N);
Nt=N/8;
for ia=1:8
   for ib=1:8
      if ia==1 && ib==1
      else
         i1 = (ia-1)*Nt(1)+1 : ia*Nt(1);   i2 = (ib-1)*Nt(2)+1 : ib*Nt(2);
         qsub=qcoef(i1,i2);
         sub=rstVariableDeadZone_sub(qsub,delta);
         coef(i1,i2)=sub;
      end
   end
end

%For the further 3-levels on DC:
for ia=1:3
   Nt=Nt/2;
   
   i1=1:Nt(1); i2=Nt(2)+1:2*Nt(2);
   coef(i1,i2)=rstVariableDeadZone_sub(qcoef(i1,i2),delta);

   i1=Nt(1)+1:2*Nt(1); i2=1:Nt(2);
   coef(i1,i2)=rstVariableDeadZone_sub(qcoef(i1,i2),delta);

   i1=Nt(1)+1:2*Nt(1); i2=Nt(2)+1:2*Nt(2);
   coef(i1,i2)=rstVariableDeadZone_sub(qcoef(i1,i2),delta);
end

coef(1:Nt(1),1:Nt(2))=rstTHDctr1(qcoef(1:Nt(1),1:Nt(2)),delta,delta,0.5*delta,0.5*delta);
