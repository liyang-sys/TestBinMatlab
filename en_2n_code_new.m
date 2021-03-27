function [bin,thd,ck,c1k,c3]=en_2n_code_new(c2n,nc,typ,maxc)

c2n=double(c2n);
if typ==1
   thd=maxc/2; n=log2(thd);   
   if n>0.5
      thdh=thd/2; sumnc=sum(nc);
      p1=sum(nc(1:thdh))/sumnc; p2=sum(nc(1:thd))/sum(nc);
      if abs(p1-0.5)<abs(p2-0.5)
         [z,cw,ck]=separate(c2n,thdh);   c1=cw-thdh;
         binz=en_z0(z);
         bink=en_2n_code_sub(ck,n-1,length(ck));
         
         [z1,c1w,c1k]=separate(c1,thdh);   c2=c1w-thdh;
         binz1=en_z0(z1);
         bink1=en_2n_code_sub(c1k,n-1,length(c1k));
         
         [z2,c2w,c2k]=separate(c2,thdh);   c3=c2w-thdh;
         binz2=en_z0(z2);
         bin2=en_2n_code_sub([c3 c2k],n-1,length(z2));
         
         bin=[0 binz binz1 binz2 bink bink1 bin2];
      else
         [z,cw,ck]=separate(c2n,thd);   cw=cw-thd;
         binz=en_z0(z);

         [zk,ckw,ckk]=separate(ck,thdh);   ckw=ckw-thdh;
         binzk=en_z0(zk);
         bin2k=en_2n_code_sub([ckw ckk],n-1,length(zk));

         [zw,cww,cwk]=separate(cw,thdh);   cww=cww-thdh;
         binzw=en_z0(zw);
         bin2w=en_2n_code_sub([cww cwk],n-1,length(zw));

         bin=[1 binz binzk binzw bin2k bin2w];
      end
   else
      [z,cw,ck]=separate(c2n,thd);   cw=cw-thd;
      bin=en_z0(z);
   end
else %typ==2
   thd=maxc/3; n=log2(thd);
   [z,cw,ck]=separate(c2n,thd);   cw=cw-thd;
   bin1=en_z0(z);
   if n>0.5
      thdh=thd/2; %%%%%%%%%%%%%%%%%%%%%%%
      [zk,ckw,ckk]=separate(ck,thdh);   ckw=ckw-thdh;
      binzk=en_z0(zk);
      bin2k=en_2n_code_sub([ckw ckk],n-1,length(zk));
      [zw,cww,cwk]=separate(cw,thd);   cww=cww-thd;
      binzw=en_z0(zw);
      bin2w=en_2n_code_sub([cww cwk],n,length(zw));
      bin2=[binzk binzw bin2k bin2w];
   else
      bin2=en_z0(cw-1);
   end   
   bin=[bin1 bin2];
end
