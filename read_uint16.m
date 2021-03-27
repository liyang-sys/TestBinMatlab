function a=read_uint16(fname,offset,sz,fm1,fm2,fp)

n=sz(1)*sz(2)*2; d=fm2-fm1+1;    a=zeros(sz(1),sz(2),d);
fid=fopen(fname);       fseek(fid, offset+(fm1-1)*n, 'bof');
for ia=1:d
   a(:,:,ia)=fread(fid,sz,'uint16'); 
end
fclose(fid); 

if fp==1
   b8=256; a1=floor(a/b8); a2=a1*b8; a=(a-a2)*b8+a1; %some need it, some don't !!! Very odd.
end
