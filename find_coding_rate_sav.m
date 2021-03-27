f=1000000/255; hg=255; lw=0;
delta=8

decom1
num=numel(a);
rate=1; fsz0=rate*num/8; er=0.0008*fsz0*1.; fsz=fsz0-er/5; 

test_en_coef1
eer0=file_size-fsz 
SN0=SN; delta0=delta;

if eer0<0
   delta=delta*(1-1/10); 
else
   delta=delta*(1+1/10); 
end
delta %%%%%%%%%%%%%%%%
coef=coef0;
test_en_coef1
eer=file_size-fsz %%%%%%%%%%%%%%%%%%%

while abs(eer)>er && abs(SN-SN0)>0.003
   delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta;
   
   delta0=delta; eer0=eer; SN0=SN;
   delta=delta2 %%%%%%%%%%%%%%%%%%%%
   coef=coef0;
   test_en_coef1
   eer=file_size-fsz %%%%%%%%%%%%%%%%%%%   
   fprintf('-------------------------------------------------------------------------\n\n')
end

fprintf('PSNR = %6.3f dB, rate = %6.4f bpp,   delta =%6.2f \n',SN,file_size*8/numel(qb), delta);
fprintf('\n===================================================================\n\n\n')
