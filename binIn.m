function a=binIn(file)

fid=fopen(file,'r');
c=fread(fid, 'uint8')'; fsz=length(c);  c=dec2bin(c,8);
fclose('all');

a=uint8(zeros(1,fsz*8));
for ia=0:fsz-1
   a(ia*8+1:(ia+1)*8)=abs(c(ia+1,:));
end
a=a-48;
