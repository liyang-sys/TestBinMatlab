%load CrowdRun_cfp8_only
%load Kimono_cfp8_only
%load Cactus_cfp8_only
%load ParkScene_cfp8_only
%load BQRerrace_cfp8_only
load OldTownCross_cfp8_only

w=128; delta=[0.25 0.5 1 2 4];

for ia=1:5
   fprintf('\ndelta =%5.2f\n',delta(ia))
   for r=1:8
      n4=[]; n8=[]; m4=[]; m8=[]; n4v8=[]; n4vH=[]; n426=[]; nHar=[]; nH=[]; sn=[]; SN4=[]; snn=[];
      fprintf('row %d:\n',r)
      for c=1:8
         %[Ncfp4,Ncfp8,Nf26,max4,max8,max26]=ssparsity(cf_cfp8_only,r,c,w,delta(ia));
         %[Ncfp4a,Ncfp8a,Nf26a,max4,max8,max26,Ncfp4,Ncfp8,Nf26,Ncfp4Ha,NHar,NHarp]=ssparsity(cf_cfp8_only,r,c,w,delta(ia));
         [Ncfp4a,Ncfp8a,Nf26a,max4,max8,max26,Nf26,Ncfp4Ha,sn4Ha,sn4,sn26,zn4,znf26]=ssparsity2(cf_cfp8_only,r,c,w,delta(ia));
         n4=[n4 Ncfp4a/Nf26a];   n8=[n8 Ncfp8a/Nf26a];
         m4=[m4 max4/max26];   m8=[m8 max8/max26];
         SN4=[SN4 sn4];
         sn=[sn sn4Ha-sn26];
         snn=[snn sn4Ha-sn4];

         %n4v8=[n4v8 Ncfp4/Ncfp8]; 
         %n4vH=[n4vH Ncfp4/Ncfp4Ha];
         %n426=[n426 Ncfp4/Nf26];
         %nHar=[nHar NHar/Nf26];
         %nH=[nH NHarp/NHar];
         
         n426=[n426 Ncfp4Ha/Nf26];
      end
      fprintf('%7.3f',n4);   fprintf('\n'); %<=== sparsity.txt
      fprintf('%7.3f',n8);   fprintf('\n'); %<=== sparsity.txt
      fprintf('%7.3f',m4);   fprintf('\n'); %<=== sparsity.txt
      fprintf('%7.3f',m8);   fprintf('<------------->\n'); %<=== sparsity.txt
      
      %fprintf('%7.3f',n4v8);   fprintf('\n'); %<=== sparsity2.txt
      %fprintf('%7.3f',n4vH);   fprintf('\n'); %<=== sparsity2.txt
      %fprintf('%7.3f',n426);   fprintf('\n'); %<=== sparsity2.txt
      %fprintf('%7.3f',nHar);   fprintf('\n'); %<=== sparsity2.txt
      %fprintf('%7.3f',nH);   fprintf('\n'); %<=== sparsity2.txt
      
      fprintf('%7.3f',n426);   fprintf('\n'); %<=== sparsity3.txt
      fprintf('%7.3f',snn);   fprintf('\n'); %<=== sparsity3.txt
      fprintf('%7.3f',SN4);   fprintf('\n'); %<=== sparsity3.txt
      fprintf('%7.3f',sn);   fprintf('\n'); %<=== sparsity3.txt
   end
   fprintf('========================================================================\n')
end