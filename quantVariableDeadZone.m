function qcoef=quantVariableDeadZone(coef,delta)

N=size(coef);
qcoef=zeros(N);
Nt=N/8;
for ia=1:8
   for ib=1:8
      if ia==1 && ib==1
      else
         i1 = (ia-1)*Nt(1)+1 : ia*Nt(1);   i2 = (ib-1)*Nt(2)+1 : ib*Nt(2);
         sub=coef(i1,i2);
         qsub=quantVariableDeadZone_sub(sub,delta);
         qcoef(i1,i2)=qsub;
      end
   end
end

%For the further 3-levels on DC:
for ia=1:3
   Nt=Nt/2;
   
   i1=1:Nt(1); i2=Nt(2)+1:2*Nt(2);
   qcoef(i1,i2)=quantVariableDeadZone_sub(coef(i1,i2),delta);

   i1=Nt(1)+1:2*Nt(1); i2=1:Nt(2);
   qcoef(i1,i2)=quantVariableDeadZone_sub(coef(i1,i2),delta);

   i1=Nt(1)+1:2*Nt(1); i2=Nt(2)+1:2*Nt(2);
   qcoef(i1,i2)=quantVariableDeadZone_sub(coef(i1,i2),delta);
end

qcoef(1:Nt(1),1:Nt(2))=quanTHD(coef(1:Nt(1),1:Nt(2)),delta,delta);
