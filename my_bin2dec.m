function [dec,total_1s]=my_bin2dec(bin,len,power2s)

dec=0; total_1s=0;
for ia=1:len
   if bin(ia)>0,  dec = dec +power2s(len-ia+1);    total_1s = total_1s+1;  end
end
