%c2n=round(rand(1,1000)*7)+1;
c2n=ceil(rand(1,1000)*128);
%c2n=ceil(rand(1,1000)*3);

thd=max(c2n)/2; n=log2(thd);
[z,cw,ck]=separate(c2n,thd);   cw=cw-thd;
%bin1=en_z0(z);

%len=length(z);
%bin=en_2n_code_sub([cw,ck],n,len);


nc=hist(c2n,[1:max(c2n)]);

%[bin,zk,ck]=en_2n_code(c2n,nc);

typ=1;
[bin,thd]=en_2n_code_new(c2n,nc,typ,max(c2n));

11111

%[c2nr,ptr,zr,zkr,ckr]=de_2n_code(bin,length(c2n),thd,1);
%[c2nr,ptr]=de_2n_code(bin,length(c2n),thd,1);

[c2nr,ptr]=de_2n_code_new(bin,length(c2n),thd,typ,1);


%[cr,ptr,cwr,ckr]=de_2n_code_sub(bin,n,z,1);

plot(double(c2nr)-double(c2n))
%plot(double(z)-double(zr))

