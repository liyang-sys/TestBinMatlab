subprop=cell(Ns,Ns);
coefprop=cell(Ns,Ns);
nn=N/Ns; nn2=nn(1)*nn(2);

Nss=ceil(Ns/4);
subprop{1,Nss}=subqcoef{1,Nss};  subprop{Nss,1}=subqcoef{Nss,1};

for ia=(Nss+1): Ns
   ia %%%%%%%%%%%%%%%%%%%%%
   subprop{1,ia}=zeros(nn);   subprop{ia,1}=subprop{1,ia};
   cpropA=zeros(1, nn2); pcA=1;
   cpropB=cpropA; pcB=1;
   for ib=1:nn(1)
      for ic=1:nn(2)
         if abs(subprop{1,ia-1}(ib,ic))>0
            tem=subqcoef{1,ia}(ib,ic);
            subprop{1,ia}(ib,ic)=tem;
            cpropA(pcA)=tem; pcA=pcA+1; 
         end

         if abs(subprop{ia-1,1}(ib,ic))>0
            tem=subqcoef{ia,1}(ib,ic);
            subprop{ia,1}(ib,ic)=tem;
            cpropB(pcB)=tem; pcB=pcB+1; 
         end
      end
   end
   coefprop{1,ia}=cpropA(1:pcA-1);
   coefprop{ia,1}=cpropB(1:pcB-1);
   fA=[sum(sum(abs(sign(subqcoef{1,ia}))))/(nn2),sum(abs(sign(coefprop{1,ia})))/length(coefprop{1,ia})]
   maxA=[max(max(abs(subqcoef{1,ia}))) max(abs(coefprop{1,ia})) sum(sum(subqcoef{1,ia}.^2)) sum(coefprop{1,ia}.^2)] 
   fB=[sum(sum(abs(sign(subqcoef{ia,1}))))/(nn2) sum(abs(sign(coefprop{ia,1})))/length(coefprop{ia,1})]
   maxB=[max(max(abs(subqcoef{ia,1}))) max(abs(coefprop{ia,1})) sum(sum(subqcoef{ia,1}.^2)) sum(coefprop{ia,1}.^2)] 
end


