function [bin,xxx]=en_sub3d_sub2_sub(r,lB,nr,cr,cri,cfk,nck,thd)
%xxx=0;

binz=en_zone_new(r,lB,nr);
%[length(r) sum(r) length(binz)]

if round(thd/3)~=thd/3, typ=1; else, typ=2; end 

if thd==2
   [z1,cf11,cf12]=separate(cfk,thdh);  cf11=cf11-thdh;
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);
   bin=[bin binz1];
elseif thd==3
   [z1,cf11,cf12]=separate(cfk,2);  cf11=cf11-2;
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);
   
   c=cf12-1; 
   [crc,k,rc,lBc,pr,nrc]=k_criterion(c);  [cri,ki,ri,lBi]=k_criterion(1-c);   maxcr=max([crc cri]);
   if maxcr>30
      binc=en_zone_new(rc,[0 lBc],nrc);
   elseif maxcr>10
      [binc,sep]=en_zone_sub2(rc,[1 0 lBc]);
   else
      binc=en_r0(rc);  binc=[1 1 binc lBc];
   end
      
   bin=[bin binz1 binc];
elseif thd==4
   [z1,cf11,cf12]=separate(cfk,thdh);  cf11=cf11-thdh;  nc12=nck(1:thdh); nc11=nck(thdh+1:thd);
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);
   
   c1=cf11-1;  
   [crc,k,rc,lBc,pr,nrc]=k_criterion(c1);  [cri,ki,ri,lBi]=k_criterion(1-c1);   maxcr=max([crc cri]);
   if maxcr>30
      binc1=en_zone_new(rc,[0 lBc],nrc);
   elseif maxcr>10
      binc1=en_zone_sub2(rc,[1 0 lBc]);
   else
      binc1=en_r0(rc);  binc1=[1 1 binc1 lBc];
   end
   
   c2=cf12-1;
   [crc,k,rc,lBc,pr,nrc]=k_criterion(c2);  [cri,ki,ri,lBi]=k_criterion(1-c2);   maxcr=max([crc cri]);
   if maxcr>30
      binc2=en_zone_new(rc,[0 lBc],nrc);
   elseif maxcr>10
      binc2=en_zone_sub2(rc,[1 0 lBc]);
   else
      binc2=en_r0(rc);  binc2=[1 1 binc2 lBc];
   end
   
   bin=[bin binz1 binc1 binc2];
elseif thd==6
   [z1,cf11,cf12]=separate(cfk,thdh);  cf11=cf11-thdh;  nc12=nck(1:thdh); nc11=nck(thdh+1:thd);
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);

   [z2A,cf21,cf22]=separate(cf12,2);
   [cr2A,k,r2A,lB2A,pr,nr2A]=k_criterion(z2A);   cri=k_criterion(1-z2A);   maxcr=max([cr2A cri]);
   if maxcr>20
      L2=1;
      binz2A=en_zone_new(r2A,lB2A,nr2A);
      
      c2=cf22-1;
      [crc,k,rc,lBc,pr,nrc]=k_criterion(c2);  [cri,ki,ri,lBi]=k_criterion(1-c2);   maxcr2=max([crc cri]);
      if maxcr2>20
         L3=1;
         binz2A=en_zone_new(r2A,lB2A,nr2A);
      else
         L3=0;
      end
   else
      L2=0;
   end
   
   
   
   
elseif thd==8
   thdh=thd/2; thdq=thd/4; thdt=thd/8;
   L2=0; L3=0; 

   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);

   [r2A,lB2A,nr2A,mcrA,mcrA0,cf21,nc21,cf22,nc22,zz]=cr_test_sav(cf11,thdq,nc11);
   if mcrA>10  &  mcrA0>6
      L2=1;
      bin_r2A=en_r_cr_sav(r2A,lB2A,nr2A,mcrA);
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,mcr3A,mcr3A0,cf31,nc31,cf32,nc32]=cr_test_sav(cf21,thdt,nc21);
      if mcr3A>10  &  mcr3A0>6
         L3=1;
         bin_r3A=en_r_cr_sav(r3A,lB3A,nr3A,mcr3A);
         bin21=bin_r3A;
         
         [r3B,lB3B,nr3B,mcr3B,mcr3B0,cf33,nc33,cf34,nc34]=cr_test_sav(cf22,thdt,nc22);   %length(cf22),mcr3B,mcr3B0%%%%%
         if mcr3B>10  &  mcr3B0>6
            L3=2;
            bin_r3B=en_r_cr_sav(r3B,lB3B,nr3B,mcr3B);
            bin22=bin_r3B;
         else
            bin22=en_2n_code_new(cf22,nc22,typ,thdq);
         end
      else
         bin21=en_2n_code_new(cf21,nc21,typ,thdq);
         bin22=en_2n_code_new(cf22,nc22,typ,thdq);
      end
      %-------------------------------------------------------------------
      bin11=[bin_r2A bin21 bin22];
      
      %Here is the rule: only if cf11 is split, cf12 is tested:
      [r2B,lB2B,nr2B,mcrB,mcrB0,cf23,nc23,cf24,nc24,z2B]=cr_test_sav(cf12,thdq,nc12);   %mcrB %%%%%% 
      if mcrB>10  &  mcrB0>6
         L2=2;
         bin_r2B=en_r_cr_sav(r2B,lB2B,nr2B,mcrB);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,mcr3C,mcr3C0,cf35,nc35,cf36,nc36,z3]=cr_test_sav(cf23,thdt,nc23); %length(cf23),mcr3C %%%%%%%%%%%
         if (mcr3C>12)  &  (mcr3C0>7)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr_sav(r3C,lB3C,nr3C,mcr3C);
            bin23=bin_r3C;
               
            [r3D,lB3D,nr3D,mcr3D,mcr3D0,cf37,nc37,cf38,nc38]=cr_test_sav(cf24,thdt,nc24); %mcr3D %%%%%%%%%%%
            if mcr3D>12  &  mcr3D0>7
               L3=4;
               bin_r3D=en_r_cr_sav(r3D,lB3D,nr3D,mcr3D);
               bin24=bin_r3D;
            else
               bin24=en_2n_code_new(cf24,nc24,typ,thdq);
            end
         else
            bin23=en_2n_code_new(cf23,nc23,typ,thdq);
            bin24=en_2n_code_new(cf24,nc24,typ,thdq);
         end
         %-------------------------------------------------------------------
         bin12=[bin_r2B bin23 bin24];
      else
         bin12=en_2n_code_new(cf12,nc12,typ,thdh);
      end
   else
      bin11=en_2n_code_new(cf11,nc11,typ,thdh);
      bin12=en_2n_code_new(cf12,nc12,typ,thdh);
   end
   bin=[binz SFcode(L2+1,3) SFcode(L3+1,5) binz1 bin11 bin12];

elseif thd==12
   thdh=6; thdq=3; thdt=2; typ3=1;
   L2=0; L3=0; 
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1); %shist(z1),cr1%%%%%%%%%%
   binz1=en_zone_new(r1,lB1,nr1);
   
   [r2A,lB2A,nr2A,mcrA,mcrA0,cf21,nc21,cf22,nc22,zz]=cr_test_sav(cf11,thdq,nc11);
   if mcrA>10  &  mcrA0>6
      L2=1;
      bin_r2A=en_r_cr_sav(r2A,lB2A,nr2A,mcrA);   
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,mcr3A,mcr3A0,cf31,nc31,cf32,nc32]=cr_test_sav(cf21,thdt,nc21); %cf32=1s!
      if mcr3A>10  &  mcr3A0>6
         L3=1;
         bin_r3A=en_r_cr_sav(r3A,lB3A,nr3A,mcr3A);
         bin31=en_2n_code_new(cf31,nc31,typ3,thdt);
         bin21=[bin_r3A bin31];
         [r3B,lB3B,nr3B,mcr3B,mcr3B0,cf33,nc33,cf34,nc34,xxx]=cr_test_sav(cf22,thdt,nc22);   %length(cf22),mcr3B,mcr3B0%%%%%
         if mcr3B>10  &  mcr3B0>6
            L3=2;
            bin_r3B=en_r_cr_sav(r3B,lB3B,nr3B,mcr3B);
            bin33=en_2n_code_new(cf33,nc33,typ3,thdt);
            bin22=[bin_r3B bin33];
         else
            bin22=en_2n_code_new(cf22,nc22,typ,thdq);
         end
      else
         bin21=en_2n_code_new(cf21,nc21,typ,thdq);
         bin22=en_2n_code_new(cf22,nc22,typ,thdq);
      end
      %-------------------------------------------------------------------
      bin11=[bin_r2A bin21 bin22];
      
      %Here is the rule: only if cf11 is split, cf12 is tested:
      [r2B,lB2B,nr2B,mcrB,mcrB0,cf23,nc23,cf24,nc24,z2B]=cr_test_sav(cf12,thdq,nc12);   %mcrB %%%%%% 
      if mcrB>10  &  mcrB0>6
         L2=2;
         bin_r2B=en_r_cr_sav(r2B,lB2B,nr2B,mcrB);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,mcr3C,mcr3C0,cf35,nc35,cf36,nc36,z3]=cr_test_sav(cf23,thdt,nc23); %length(cf23),mcr3C %%%%%%%%%%%
         if (mcr3C>12)  &  (mcr3C0>7)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr_sav(r3C,lB3C,nr3C,mcr3C);
            bin35=en_2n_code_new(cf35,nc35,typ3,thdt);
            bin23=[bin_r3C bin35];
         
            [r3D,lB3D,nr3D,mcr3D,mcr3D0,cf37,nc37,cf38,nc38]=cr_test_sav(cf24,thdt,nc24); %mcr3D %%%%%%%%%%%
            if mcr3D>12  &  mcr3D0>7
               L3=4;
               bin_r3D=en_r_cr_sav(r3D,lB3D,nr3D,mcr3D);
               bin37=en_2n_code_new(cf37,nc37,typ3,thdt);
               bin24=[bin_r3D bin37];
            else
               bin24=en_2n_code_new(cf24,nc24,typ,thdq);
            end
         else
            bin23=en_2n_code_new(cf23,nc23,typ,thdq);
            bin24=en_2n_code_new(cf24,nc24,typ,thdq);
         end
         %-------------------------------------------------------------------
         bin12=[bin_r2B bin23 bin24];
      else
         bin12=en_2n_code_new(cf12,nc12,typ,thdh);
      end
   else
      bin11=en_2n_code_new(cf11,nc11,typ,thdh);
      bin12=en_2n_code_new(cf12,nc12,typ,thdh);
   end
   bin=[binz SFcode(L2+1,3) SFcode(L3+1,5) binz1 bin11 bin12];
   
elseif thd>=16
   thdh=thd/2; thdq=thd/4; thdt=thd/8;
   L2=0; L3=0; 

   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,k,r1,lB1,pr,nr1]=k_criterion(z1);
   binz1=en_zone_new(r1,lB1,nr1);

   [r2A,lB2A,nr2A,mcrA,mcrA0,cf21,nc21,cf22,nc22,zz]=cr_test_sav(cf11,thdq,nc11);
   if mcrA>10  &  mcrA0>6
      L2=1;
      bin_r2A=en_r_cr_sav(r2A,lB2A,nr2A,mcrA);
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,mcr3A,mcr3A0,cf31,nc31,cf32,nc32]=cr_test_sav(cf21,thdt,nc21);
      if mcr3A>10  &  mcr3A0>6
         L3=1;
         bin_r3A=en_r_cr_sav(r3A,lB3A,nr3A,mcr3A);
         bin31=en_2n_code_new(cf31,nc31,typ,thdt);
         bin32=en_2n_code_new(cf32,nc32,typ,thdt);
         bin21=[bin_r3A bin31 bin32];
         
         [r3B,lB3B,nr3B,mcr3B,mcr3B0,cf33,nc33,cf34,nc34]=cr_test_sav(cf22,thdt,nc22);   %length(cf22),mcr3B,mcr3B0%%%%%
         if mcr3B>10  &  mcr3B0>6
            L3=2;
            bin_r3B=en_r_cr_sav(r3B,lB3B,nr3B,mcr3B);
            bin33=en_2n_code_new(cf33,nc33,typ,thdt);
            bin34=en_2n_code_new(cf34,nc34,typ,thdt);
            bin22=[bin_r3B bin33 bin34];
         else
            bin22=en_2n_code_new(cf22,nc22,typ,thdq);
         end
      else
         bin21=en_2n_code_new(cf21,nc21,typ,thdq);
         bin22=en_2n_code_new(cf22,nc22,typ,thdq);
      end
      %-------------------------------------------------------------------
      bin11=[bin_r2A bin21 bin22];
      
      %Here is the rule: only if cf11 is split, cf12 is tested:
      [r2B,lB2B,nr2B,mcrB,mcrB0,cf23,nc23,cf24,nc24,z2B]=cr_test_sav(cf12,thdq,nc12);   %mcrB %%%%%% 
      if mcrB>10  &  mcrB0>6
         L2=2;
         bin_r2B=en_r_cr_sav(r2B,lB2B,nr2B,mcrB);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,mcr3C,mcr3C0,cf35,nc35,cf36,nc36,z3]=cr_test_sav(cf23,thdt,nc23); %length(cf23),mcr3C,mcr3C0 %%%%%%%%%%%
         if (mcr3C>12)  &  (mcr3C0>7)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr_sav(r3C,lB3C,nr3C,mcr3C);
            bin35=en_2n_code_new(cf35,nc35,typ,thdt);
            bin36=en_2n_code_new(cf36,nc36,typ,thdt);
            bin23=[bin_r3C bin35 bin36];
         
            [r3D,lB3D,nr3D,mcr3D,mcr3D0,cf37,nc37,cf38,nc38]=cr_test_sav(cf24,thdt,nc24); %mcr3D %%%%%%%%%%%
            if mcr3D>12  &  mcr3D0>7
               L3=4;
               bin_r3D=en_r_cr_sav(r3D,lB3D,nr3D,mcr3D);
               bin37=en_2n_code_new(cf37,nc37,typ,thdt);
               bin38=en_2n_code_new(cf38,nc38,typ,thdt);
               %len3D=[length(bin_r3D) sum(r3D) length(bin37) length(bin38)] %%%%%%%%%%%%%
               bin24=[bin_r3D bin37 bin38];
            else
               bin24=en_2n_code_new(cf24,nc24,typ,thdq);
            end
         else
            bin23=en_2n_code_new(cf23,nc23,typ,thdq);
            bin24=en_2n_code_new(cf24,nc24,typ,thdq);
         end
         %-------------------------------------------------------------------
         bin12=[bin_r2B bin23 bin24];
      else
         bin12=en_2n_code_new(cf12,nc12,typ,thdh);
      end
      
   else
      bin11=en_2n_code_new(cf11,nc11,typ,thdh);
      bin12=en_2n_code_new(cf12,nc12,typ,thdh);
   end
   bin=[binz SFcode(L2+1,3) SFcode(L3+1,5) binz1 bin11 bin12];
end

L2,L3   %%%%%%%%%%%%
len=length(bin) %%%%%%%%%%%%%%
%lennnnnn=length([binz SFcode(L2+1,3) SFcode(L3+1,5)  binz1]) %%%%%%%%%%%%%%
%bin=0;
