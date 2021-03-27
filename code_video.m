%load Cactus_cfp8_3d_transformed_5lev; 
%load ParkScene_cfp8_3d_transformed_5lev;
%load Kimono_cfp8_3d_transformed_5lev;
%load CrowdRun_cfp8_3d_transformed_5lev;
%load BQRerrace_cfp8_3d_transformed_5lev;
load OldTownCross_cfp8_3d_transformed_5lev;

%delta=2
%delta=2.2  %BQRerrace
delta=2.1  %OldTownCross

qcoef=quanTHD(coef,delta,delta);

Ldc=qcoef(:,:,2);
L1=qcoef(:,:,5);
L2=qcoef(:,:,9:10);
L3=qcoef(:,:,17:20);
L4=qcoef(:,:,33:40);
L5=qcoef(:,:,65:80);

%statistics_video(qcoef);
%clear qcoef


%=========================================================================
N=size(Ldc);

%L5: 
NnonL5=cell(16); subL5=cell(9,3,16);
bin=uint8([]);
for ia=4:16
   [NnonL5{ia},zone0,subzone,subqcf]=Coef_Statistics_5lev(L5(:,:,ia));
   %max(max(abs(subqcf{7,1}))),sum(sum(abs(sign(subqcf{7,1}))))
   bin=[en_coef_L345(subqcf,N) bin];
   %bin=[ttttt(subqcf,N) bin];
   [ia length(bin)] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for ib=1:9
      for ic=1:3
         subL5{ib,ic,ia}=subqcf{ib,ic};
      end
   end
end

%L4: 
NnonL4=cell(8); subL4=cell(9,3,8);
for ia=1:8
   [NnonL4{ia},zone0,subzone,subqcf]=Coef_Statistics_5lev(L4(:,:,ia));
   bin=[en_coef_L345(subqcf,N) bin];
   [ia length(bin)] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for ib=1:9
      for ic=1:3
         subL4{ib,ic,ia}=subqcf{ib,ic};
      end
   end
end

%L3: 
NnonL3=cell(4); subL3=cell(9,3,4);
for ia=1:4
   [NnonL3{ia},zone0,subzone,subqcf]=Coef_Statistics_5lev(L3(:,:,ia));
   bin=[en_coef_L345(subqcf,N) bin];
   [ia length(bin)] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for ib=1:9
      for ic=1:3
         subL3{ib,ic,ia}=subqcf{ib,ic};
      end
   end
end

%L2: 
NnonL2=cell(2); subL2=cell(9,3,2);
for ia=1:2
   [NnonL2{ia},zone0,subzone,subqcf]=Coef_Statistics(L2(:,:,ia));
   bin=[en_coef_L12(subqcf,N) bin];
   [ia length(bin)] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   for ib=1:9
      for ic=1:3
         subL2{ib,ic,ia}=subqcf{ib,ic};
      end
   end
end

%L1
[NnonL1,zone0,subzone,subL1]=Coef_Statistics(L1);
bin=[en_coef_L12(subL1,N) bin];
length(bin) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ldc
[NnonDC,zone0,subzone,subDC]=Coef_Statistics(Ldc);
bin=[en_coef_dc(subDC,N) bin];
length(bin) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
