function [m,stnew,L,Nsub,nsubtem,len]=modify_Hilbert3D_sub3D(dim,inc,m0,N0,Nsub,st0,nsubtem,L0,k0)

load n3D
if k0==3
   if inc==-1
      n=n87;
   elseif inc==-2
      n=n86;
   elseif inc==-3
      n=n85;
   elseif inc==-4
      n=n84;
   elseif inc==-5
      n=n83;
   elseif inc==-6
      n=n82;
   elseif inc==-7
      n=n81;
   end
elseif k0==2
else %k0==1
end

r0=m0(1,:); c0=m0(2,:); d0=m0(3,:);
subdim=abs(inc)*2; 
nsub=double(dim/subdim);  %the number of sub-squares that need to be stretched
st=int32(ones(1,nsub));  %The number of starting points is equal to the number of sub-squares.
L=log2(nsub);
for ia=L0:L %Finding 'st' at level L from level 'L0'. When level in increased by 1, the number in 'st' is doubled. 
   nsubtem=nsubtem*2; %The number of sub-squares in doubled, and thus the number in 'st' is doubled accordingly.
   Nsub=Nsub/4;   %the number of elements in the sub-square
   for pt=2:2:nsubtem %the added 'st' points
      pt0=pt/2; %performing pt/2, the added points becomes the initial points
      st(pt-1)=st0(pt0)+Nsub;
      st(pt)=st(pt-1)+Nsub;    
   end
   st0=st;
end

%Below, the 'vertical' and 'horizatal' feature is used again to perform the increament and decrement:
hN=Nsub/2; hN1=hN+1; qN=Nsub/4; qN1=qN+1; hqN=hN+qN; hqN1=hqN+1;
Nsub1=Nsub+1; Nq=Nsub+qN; Nq1=Nq+1; Nh=Nsub+hN;  rsub=zeros(1,Nsub+hN); csub=rsub; dsub=rsub;
if inc>0
   len=N0+nsub*hN; r=int32(zeros(1,len)); c=r; d=r;   stnew=st+int32([0:hN:hN*(nsub-1)]);
else
   len=N0-nsub*hN; r=int32(zeros(1,len)); c=r; d=r;   stnew=st-int32([0:hN:hN*(nsub-1)]);
end

ed0=1; ednew0=1;
for ib=1:nsub
   s=st(ib); ed=st(ib)+Nsub-1;
   rsub0=r0(s:ed);   csub0=c0(s:ed);   dsub0=d0(s:ed);
   sr3=rsub0(qN1:hqN)+inc;
   sc3=csub0(qN1:hqN);
   sd3=dsub0(qN1:hqN);
   if inc>0
      %There will be 6 sub-squares, and they are devided into 5 connected parts below.
      sr1=rsub0(1:qN);        sc1=csub0(1:qN);        sd1=dsub0(1:qN);
      sr2=sr1+inc;            %sc2=sc1, sd2=sd1, thus, use sc1 below directly.
      sr5=rsub0(hqN1:Nsub);   sc5=csub0(hqN1:Nsub);   sd5=dsub0(hqN1:Nsub);
      sr4=sr5+inc;            %sc4=sc5, sd4=sd5, thus, use sc5 below directly.
      
      rsub(1:qN)=sr1; rsub(qN1:hN)=sr2; rsub(hN1:Nsub)=sr3; rsub(Nsub1:Nq)=sr4;  rsub(Nq1:Nh)=sr5;
      csub(1:qN)=sc1; csub(qN1:hN)=sc1; csub(hN1:Nsub)=sc3; csub(Nsub1:Nq)=sc5;  csub(Nq1:Nh)=sc5;
      dsub(1:qN)=sd1; dsub(qN1:hN)=sd1; dsub(hN1:Nsub)=sd3; dsub(Nsub1:Nq)=sd5;  dsub(Nq1:Nh)=sd5;
      snew=stnew(ib); ednew=stnew(ib)+Nsub+hN-1;
      r(ednew0:snew-1)=r0(ed0:s-1); r(snew:ednew)=rsub; 
      c(ednew0:snew-1)=c0(ed0:s-1); c(snew:ednew)=csub; 
      d(ednew0:snew-1)=d0(ed0:s-1); d(snew:ednew)=dsub; 
      ed0=ed; ednew0=ednew;
   else
      snew=stnew(ib); ednew=stnew(ib)+hN-1;
      r(ednew0:snew-1)=r0(ed0:s-1); 
      r(snew:ednew)=sr3; 
      c(ednew0:snew-1)=c0(ed0:s-1); 
      c(snew:ednew)=sc3; 
      d(ednew0:snew-1)=d0(ed0:s-1); 
      d(snew:ednew)=sd3; 
      ed0=ed; ednew0=ednew;
   end
end
r(ednew0+1:len)=r0(ed0+1:N0);  c(ednew0+1:len)=c0(ed0+1:N0);  d(ednew0+1:len)=d0(ed0+1:N0);
m=[r; c; d];
if inc>0
   stnew=stnew+qN;
else
   stnew=stnew-qN;
end


