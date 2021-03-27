function [bin,xxx]=en_sub3d_sub2_sub(z,r,lB,pr,nr,scr,scrc,cfk,nck,thd)

if round(thd/3)~=thd/3, typ=1; else, typ=2; end 

%111111, save tem3 r lB nr scr scrc pr z
%save tem r lB nr scr scrc pr z
binz=en_r_cr(r,lB,nr,scr,scrc,pr,z);
%whos binz
%[zr,ptr]=de_r_cr(binz,length(z),1);
%plot(double(zr)-double(z))

if thd==1
   bin=binz;
elseif thd==2
   thdh=1;
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);
   bin=[binz binz1];
elseif thd==3
   thdh=2; thdq=1;
   L2=0; 
   
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);
   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin11=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);
   else
      typ=1; bin11=en_2n_code_new(cf11,nc11,typ,thdh);
   end
   bin=[binz L2 binz1 bin11];
   
elseif thd==4
   thdh=thd/2; thdq=thd/4;
   L2=0; 

   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);

   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin11=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);
      
      %Here is the rule: only if cf11 is split, cf12 is tested:
      [r2B,lB2B,nr2B,scrB,scrcB,cf23,nc23,cf24,nc24,z2B,pr]=cr_test(cf12,thdq,nc12);   %scrB %%%%%% 
      if scrB>12
         L2=2;
         bin12=en_r_cr(r2B,lB2B,nr2B,scrB,scrcB,pr,z2B);
      else
         bin12=en_2n_code_new(cf12,nc12,typ,thdh);
      end
   else
      bin11=en_2n_code_new(cf11,nc11,typ,thdh);
      bin12=en_2n_code_new(cf12,nc12,typ,thdh);
   end
   bin=[binz SFcode(L2+1,3) binz1 bin11 bin12];

elseif thd==6
   
   thdh=3; thdq=2; thdt=1; typ2=1;
   L2=0; L3=0; 
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);
   
   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin_r2A=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);   
      
      %Now node 3A: ---------------------------------------------------
      [r3A,lB3A,nr3A,scr3A,scrc3A,cf31,nc31,cf32,nc32,z3A,pr]=cr_test(cf21,thdt,nc21); %cf22=1s! 
      if scr3A>12
         L3=1;
         bin_r3A=en_r_cr(r3A,lB3A,nr3A,scr3A,scrc3A,pr,z3A);
         bin21=bin_r3A;
      else
         bin21=en_2n_code_new(cf21,nc21,typ2,thdq);
      end
      %-------------------------------------------------------------------
      bin11=[bin_r2A bin21]; %cf22=1s!
      
      %Here is the rule: only if cf11 is split, cf12 is tested:
      [r2B,lB2B,nr2B,scrB,scrcB,cf23,nc23,cf24,nc24,zB,pr]=cr_test(cf12,thdq,nc12);   %scrB %%%%%%
      if scrB>12
         L2=2;
         bin_r2B=en_r_cr(r2B,lB2B,nr2B,scrB,scrcB,pr,zB);
         
         %Now node 3C: ---------------------------------------------------
         [r3C,lB3C,nr3C,scr3C,scrc3C,cf35,nc35,cf36,nc36,z3,pr]=cr_test(cf23,thdt,nc23); %length(cf23),scr3C %%%%%%%%%%%
         if (scr3C>16)  &  (L3==1)  
            L3=2;
            bin_r3C=en_r_cr(r3C,lB3C,nr3C,scr3C,scrc3C,pr,z3);
            bin23=bin_r3C;
         else
            bin23=en_2n_code_new(cf23,nc23,typ2,thdq);
         end
         %-------------------------------------------------------------------
         bin12=[bin_r2B bin23];
      else
         bin12=en_2n_code_new(cf12,nc12,typ,thdh);
      end
   else
      bin11=en_2n_code_new(cf11,nc11,typ,thdh);
      bin12=en_2n_code_new(cf12,nc12,typ,thdh);
   end
   bin=[binz SFcode(L2+1,3) SFcode(L3+1,3) binz1 bin11 bin12];
   %L2, L3 %%%%%%%%%%%%%%%%

elseif thd==8
   thdh=thd/2; thdq=thd/4; thdt=thd/8;
   L2=0; L3=0; 

   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);

   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin_r2A=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,scr3A,scrc3A,cf31,nc31,cf32,nc32,z3A,pr]=cr_test(cf21,thdt,nc21);
      if scr3A>12
         L3=1;
         bin_r3A=en_r_cr(r3A,lB3A,nr3A,scr3A,scrc3A,pr,z3A);
         bin21=bin_r3A;
         
         [r3B,lB3B,nr3B,scr3B,scrc3B,cf33,nc33,cf34,nc34,z3B,pr]=cr_test(cf22,thdt,nc22);   %length(cf22),scr3B,scrc3B0%%%%%
         if scr3B>12
            L3=2;
            bin_r3B=en_r_cr(r3B,lB3B,nr3B,scr3B,scrc3B,pr,z3B);
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
      [r2B,lB2B,nr2B,scrB,scrcB,cf23,nc23,cf24,nc24,z2B,pr]=cr_test(cf12,thdq,nc12);   %scrB %%%%%% 
      if scrB>12
         L2=2;
         bin_r2B=en_r_cr(r2B,lB2B,nr2B,scrB,scrcB,pr,z2B);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,scr3C,scrc3C,cf35,nc35,cf36,nc36,z3,pr]=cr_test(cf23,thdt,nc23); %length(cf23),scr3C %%%%%%%%%%%
         if (scr3C>16)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr(r3C,lB3C,nr3C,scr3C,scrc3C,pr,z3);
            bin23=bin_r3C;
               
            [r3D,lB3D,nr3D,scr3D,scrc3D,cf37,nc37,cf38,nc38,z3D,pr]=cr_test(cf24,thdt,nc24); %scr3D %%%%%%%%%%%
            if scr3D>16
               L3=4;
               bin_r3D=en_r_cr(r3D,lB3D,nr3D,scr3D,scrc3D,pr,z3D);
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
   %L2,L3 %%%%%%%%%%%%%%%%%

elseif thd==12
   thdh=6; thdq=3; thdt=2; typ3=1;
   L2=0; L3=0; 
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);

   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);
   
   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin_r2A=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);   
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,scr3A,scrc3A,cf31,nc31,cf32,nc32,z3A,pr]=cr_test(cf21,thdt,nc21); %cf32=1s!
      if scr3A>12
         L3=1;
         bin_r3A=en_r_cr(r3A,lB3A,nr3A,scr3A,scrc3A,pr,z3A);
         bin31=en_2n_code_new(cf31,nc31,typ3,thdt);
         bin21=[bin_r3A bin31];
         [r3B,lB3B,nr3B,scr3B,scrc3B,cf33,nc33,cf34,nc34,z3B,pr]=cr_test(cf22,thdt,nc22);   %length(cf22),scr3B,scrc3B0%%%%%
         if scr3B>12
            L3=2;
            bin_r3B=en_r_cr(r3B,lB3B,nr3B,scr3B,scrc3B,pr,z3B);
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
      [r2B,lB2B,nr2B,scrB,scrcB,cf23,nc23,cf24,nc24,z2B,pr]=cr_test(cf12,thdq,nc12);   %scrB %%%%%% 
      if scrB>12
         L2=2;
         bin_r2B=en_r_cr(r2B,lB2B,nr2B,scrB,scrcB,pr,z2B);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,scr3C,scrc3C,cf35,nc35,cf36,nc36,z3,pr]=cr_test(cf23,thdt,nc23); %length(cf23),scr3C %%%%%%%%%%%
         if (scr3C>16)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr(r3C,lB3C,nr3C,scr3C,scrc3C,pr,z3);
            bin35=en_2n_code_new(cf35,nc35,typ3,thdt);
            bin23=[bin_r3C bin35];
         
            [r3D,lB3D,nr3D,scr3D,scrc3D,cf37,nc37,cf38,nc38,z3D,pr]=cr_test(cf24,thdt,nc24); %scr3D %%%%%%%%%%%
            if scr3D>16
               L3=4;
               bin_r3D=en_r_cr(r3D,lB3D,nr3D,scr3D,scrc3D,pr,z3D);
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
   %L2,L3 %%%%%%%%%%%%%%%%%
   
elseif thd>=16
   thdh=thd/2; thdq=thd/4; thdt=thd/8;
   L2=0; L3=0; 

   %aaa=[max(cfk),thd, thdh] %%%%%%%%%%%%%%%%%%
   [z1,cf12,cf11]=separate(cfk,thdh);  cf12=cf12-thdh; nc12=nck(thdh+1:thd); nc11=nck(1:thdh);
   [cr1,crc1,r1,lB1,pr,nr1]=k_criterion(z1);  [cr1i,crc1i]=k_criterion(1-z1);  scr1=cr1+cr1i;  scrc1=crc1+crc1i;
   binz1=en_r_cr(r1,lB1,nr1,scr1,scrc1,pr,z1);

   [r2A,lB2A,nr2A,scrA,scrcA,cf21,nc21,cf22,nc22,zz,pr]=cr_test(cf11,thdq,nc11);
   if scrA>12
      L2=1;
      bin_r2A=en_r_cr(r2A,lB2A,nr2A,scrA,scrcA,pr,zz);
      
      %Now node 3A 3B: ---------------------------------------------------
      [r3A,lB3A,nr3A,scr3A,scrc3A,cf31,nc31,cf32,nc32,z3A,pr]=cr_test(cf21,thdt,nc21);
      if scr3A>12
         L3=1;
         bin_r3A=en_r_cr(r3A,lB3A,nr3A,scr3A,scrc3A,pr,z3A);
         bin31=en_2n_code_new(cf31,nc31,typ,thdt);
         bin32=en_2n_code_new(cf32,nc32,typ,thdt);
         bin21=[bin_r3A bin31 bin32];
         
         [r3B,lB3B,nr3B,scr3B,scrc3B,cf33,nc33,cf34,nc34,z3B,pr]=cr_test(cf22,thdt,nc22);   %length(cf22),scr3B,scrc3B0%%%%%
         if scr3B>12
            L3=2;
            bin_r3B=en_r_cr(r3B,lB3B,nr3B,scr3B,scrc3B,pr,z3B);
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
      [r2B,lB2B,nr2B,scrB,scrcB,cf23,nc23,cf24,nc24,z2B,pr]=cr_test(cf12,thdq,nc12);   %scrB %%%%%% 
      if scrB>12
         L2=2;
         bin_r2B=en_r_cr(r2B,lB2B,nr2B,scrB,scrcB,pr,z2B);
         
         %Now node 3C 3D: ---------------------------------------------------
         [r3C,lB3C,nr3C,scr3C,scrc3C,cf35,nc35,cf36,nc36,z3,pr]=cr_test(cf23,thdt,nc23); %length(cf23),scr3C,scrc3C0 %%%%%%%%%%%
         if (scr3C>16)  &  (L3==2)  
            L3=3;
            bin_r3C=en_r_cr(r3C,lB3C,nr3C,scr3C,scrc3C,pr,z3);
            bin35=en_2n_code_new(cf35,nc35,typ,thdt);
            bin36=en_2n_code_new(cf36,nc36,typ,thdt);
            bin23=[bin_r3C bin35 bin36];
         
            [r3D,lB3D,nr3D,scr3D,scrc3D,cf37,nc37,cf38,nc38,z3D,pr]=cr_test(cf24,thdt,nc24); %scr3D %%%%%%%%%%%
            if scr3D>16
               L3=4;
               bin_r3D=en_r_cr(r3D,lB3D,nr3D,scr3D,scrc3D,pr,z3D);
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
   %L2,L3 %%%%%%%%%%%%%%%%%
end

%lenbinnn=length(bin) %%%%%%%%%%%%%%
%lennnnnn=length([binz SFcode(L2+1,3) SFcode(L3+1,5)  binz1]) %%%%%%%%%%%%%%
xxx=z;
