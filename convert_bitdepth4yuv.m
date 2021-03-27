function [Y,U,V] = convert_bitdepth4yuv(infile,H,W,fm,bitdepth,fmt,outfile)

fid=fopen(infile); hH=H; hW=W/2;
if fmt==420
   hH=H/2; hW=W/2;
end

fid1=fopen(outfile,'wb');


%Y=uint16(zeros(H,W,fm));
%U=uint16(zeros(hH,hW,fm));    V=U;
%Y=uint16(zeros(H,W));
%U=uint16(zeros(hH,hW));    V=U;

hH,hW
for ia=1:fm
   ia
   Y=fread(fid,[W H],bitdepth); 
   U=fread(fid,[hW hH],bitdepth); 
   V=fread(fid,[hW hH],bitdepth); 
   
   fwrite(fid1,uint8(Y/4));
   fwrite(fid1,uint8(U/4));
   fwrite(fid1,uint8(V/4));
end
fclose('all');


