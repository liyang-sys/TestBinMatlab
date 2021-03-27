[ a ] = pfmread_op('memorial_o876_gry.pfm');
sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=200^(1/511);
if (round(sz1/8)~= sz1/8) || (round(sz2/8)~= sz2/8) || sz3>1 || min([sz1,sz2])<256 || max([sz1,sz2])>12288
   fprintf('\n   Please only use the Y component of the color image.');
   fprintf('\n   Each dimention of the image needs to be within the range: 256 to 12288.');
   fprintf('\n   The minimum coding unit of the image is 8x8. \n');
   fprintf('\n   Please try again. \n\n');
else
   delta = input('Enter the quantization step size: ','s'); delta=str2double(delta);
   depth=16;
   if delta < 0.5 || delta >100 || round(depth)~=depth || depth<8 || depth>16
      fprintf('\n   The range of quantization step size is 0.5 to 100.');
      fprintf('\n   Make sure you entered correct bitdepth.\n'); 
      fprintf('\n   Please try again. \n\n');
   else
      outfile='endata';

      nn=round(log(delta/0.5)/log(inc));  delta=0.5*inc^nn;
      nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMO色调映射部分----------------------------------%
f = input('Enter the f: ','s'); f=str2double(f);
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
hdr255=a/maxy*255.0;
[ img ] = tmo_mod2( hdr255, lav, m, f, maxy );
[ ldri ] = tmo_mod2( hdr255, lav, m, 0, maxy );
maximg=max(max(img));
%--------------------------------------------------------------------------------%
      fprintf('\n Compression starts. Performing transform on the image ...\n');
      M=8; lev=3; [coef,fL]=LFP2(img,M);  tanTheta=1/8; coef=block2bd(coef,M,lev,tanTheta);
      binary=en_coef2D_new(coef,delta); binary=[nn binary];

      fsz=binOut(outfile,binary);
   end
end

[ hdr, ldr ] = tmo2_mod2( img, f, lav, m, maxy);
