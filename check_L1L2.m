[z1,cf2,cf1k]=separate(cf0,1);   
%[r1,lB,p1]=Golomb0(z1); lB=uint8(lB);  [bin1,sepA]=en_zone_sub_new(r1,850,lB);  %<== encoding z1 
[r1,lB,p1]=Golomb0(z1); lB=uint8(lB);  [bin1,sepA]=en_zone_sub(r1,lB);  %<== encoding z1 
[cr1,k1]=k_criterion(z1)
%p1,
%[rc,lB,pc]=Golomb0(cf1k); lB=uint8(lB);  [binc,sepB]=en_zone_sub_new(rc,850,lB);  %<== encoding cf1k 
[rc,lB,pc]=Golomb0(cf1k); lB=uint8(lB);  [binc,sepB]=en_zone_sub(rc,lB);  %<== encoding cf1k 
[cr1k,k1k]=k_criterion(cf1k)
%pc,

len1=length(bin1)
lenc=length(binc)
len=len1+lenc


[z,cf1,cfk]=separate(cf0,0);   
%[r,lB,p]=Golomb0(z); lB=uint8(lB);  [bin,sepC]=en_zone_sub_new(r,850,lB);  %<== encoding z 
[r,lB,p]=Golomb0(z); lB=uint8(lB);  [bin,sepC]=en_zone_sub(r,lB);  %<== encoding z 
[cr,k]=k_criterion(z)
%p
lenz=length(bin)
[z11,cf2a,cf1ka]=separate(cf1,1);   
[cr11,k11]=k_criterion(z11)
%[r11,lB,p11]=Golomb0(z11); lB=uint8(lB);  [bin11,sepD]=en_zone_sub_new(r11,300,lB);  %<== encoding z 
[r11,lB,p11]=Golomb0(z11); lB=uint8(lB);  [bin11,sepD]=en_zone_sub(r11,lB);  %<== encoding z 
%p11
len11=length(bin11)
lenn=lenz+len11


