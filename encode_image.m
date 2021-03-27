infile='\SignifProp\lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
sz1=size(a,1); sz2=size(a,2);

delta = 20;
M=8; lev=3; [coef,fL]=LFP2(a,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
fprintf('Transform finished ... \n');
binary=en_coef2D_new(coef,delta);

bitrate=length(binary)/numel(a)
