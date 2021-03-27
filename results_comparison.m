load cactus_96frames
load result_cactus_d15

nel=1024*1024;
snr=zeros(1,32);
for ia=1:32
   e=double(ar(:,:,ia+32)) -double(a(:,:,ia+32)); e=e.*e; e=sum(sum(e))/nel;
   snr(ia)=20*log10(256/sqrt(e));
end

%=================================================================
%infile='cactus_intra26.yuv'; fid=fopen(infile); 
infile='cactus_intra30.yuv'; fid=fopen(infile); 

a_intra=zeros(1024,1024,32);
snr_intra=zeros(1,32);
for ia=1:32
   a_intra(:,:,ia)=fread(fid,[1024 1024],'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 

   e=double(a_intra(:,:,ia))/511*255 -double(a(:,:,ia+32)); e=e.*e; e=sum(sum(e))/nel;
   snr_intra(ia)=20*log10(256/sqrt(e));
end
fclose(fid);

%=================================================================
%infile='cactus_inter18.yuv'; fid=fopen(infile); 
infile='cactus_inter21.yuv'; fid=fopen(infile); 

a_inter=zeros(1024,1024,32);
snr_inter=zeros(1,32);
for ia=1:32
   a_inter(:,:,ia)=fread(fid,[1024 1024],'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 

   e=double(a_inter(:,:,ia))/1023*255 -double(a(:,:,ia+32)); e=e.*e; e=sum(sum(e))/nel;
   snr_inter(ia)=20*log10(256/sqrt(e));
end
fclose(fid);


