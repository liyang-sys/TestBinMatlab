function A=read_float32(fname,offset,sz,fm)

n=4*sz(1)*sz(2);

fid=fopen(fname); 
fseek(fid, offset+(fm-1)*n, 'bof');
a=fread(fid, n)';
fclose(fid);

a=reshape(flipud(reshape(uint8(a),4,n/4)),1,n);

infile='test.bin'; fid=fopen(infile,'w');
fwrite(fid,a,'uint8');
fclose(fid);
fid=fopen(infile);
A=fread(fid,sz,'single')';
fclose(fid);
