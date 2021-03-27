function [A,u,v]=read_yuv(infile,h,w,f1,Nframe,fmt,bitdepth)

hh=h/2; hw=w/2;
if bitdepth==10
   tp='uint16'; nby=2;
else %bitdepth=8
   tp='uint8'; nby=1;
end

fm_cnt=0;
A=zeros(h,w,Nframe);
fid=fopen(infile); 
for ia=f1:f1+Nframe-1
   if fmt==444
      fseek(fid,(ia-1)*w*h*3*nby,'bof'); 
      Y=fread(fid, [w,h],tp)';
      u=fread(fid, [w,h],tp)';      v=fread(fid, [w,h],tp)';
   elseif fmt==422
      fseek(fid,(ia-1)*w*h*2*nby,'bof'); 
      Y=fread(fid, [w,h],tp)';
      u=fread(fid, [w,hh],tp)';      v=fread(fid, [w,hh],tp)';
   else %fmt=420
      fseek(fid,(ia-1)*w*h*1.5*nby,'bof');
      Y=fread(fid, [w,h],tp)';
      u=fread(fid, [hw,hh],tp)';      v=fread(fid, [hw,hh],tp)';
   end
   fm_cnt=fm_cnt+1;
   A(:,:,fm_cnt)=Y;
end
%whos Y u v

fclose(fid);
