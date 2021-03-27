outfile='\image\rec_Fuji_HEVC_QP30.yuv'; 
%outfile='\image\rec_UHD_HEVC_QP27.yuv'; 
%outfile='\image\rec_xray1536x1536QP21.yuv'; 

bitdepth='uint16'; byte=2;
%bitdepth='uint8'; byte=1;

%H=1536; W=1536;
%H=2160; W=3840;
H=6192; W=8256;

frame=4;
fid=fopen(outfile);
a=zeros(H,W,frame); fm=0;
for ia=1:frame
   fseek(fid,(ia-1)*W*H*1.5*byte,'bof');    Y=fread(fid, [W,H], bitdepth)';
   u=fread(fid, [W,H]/2, bitdepth)';
   v=fread(fid, [W,H]/2, bitdepth)';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);

