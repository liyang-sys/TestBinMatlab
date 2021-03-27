coef=de_coef2D_new(binary,delta);
fprintf('Performing the Inverse Transform ... \n');

M=8; lev=3; tanTheta=0.125; coef=bd2block(coef,M,lev,tanTheta); qb=LFP2Inv_with_fL(coef,M);

qbb=qb;
   for ia=1:sz1
      for ib=1:sz2
         if qbb(ia,ib)>255
            qbb(ia,ib)=255;
         elseif qbb(ia,ib)<0
            qbb(ia,ib)=0;
         end
      end
   end
   eq=qbb-a;
   
   e=qbb-a;
   e=e.^2;
   e=sqrt(sum(sum(e))/numel(qb));
   SN=20*log10(255/e)
