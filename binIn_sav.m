function a=binIn(file)

fid=fopen(file,'r');
c=fread(fid, 'uint8')'; fsz=length(c);
fclose('all');
a=zeros(1,fsz*8);
for ia=0:fsz-1
   b=dec2bin(c(ia+1),8);
   a(ia*8+1:(ia+1)*8)=abs(b);
end
a=a-48;
