function fsz=binOut(file,zone)

len=length(zone);
fsz=ceil(len/8);
zone=[zone ones(1,fsz*8-len)];
a=char(double(zone)+48); %note:  abs('0')=48  and  abs('1')=49
b=uint8(zeros(1,fsz));
for ia=0:fsz-1
   b(ia+1)=uint8(bin2dec(a(ia*8+1:(ia+1)*8)));
end
fid=fopen(file, 'w');
fwrite(fid, b, 'uint8');
fclose('all');
