function bin=en_2n_code_sub(c,n,len)

if n>0.5
   bin=dec2bin(c-1,n); 
   bin=reshape(bin',1,n*len);
   bin=uint8(abs(bin)-48);
else
   bin=[];
end
