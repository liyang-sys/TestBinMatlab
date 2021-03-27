len=50000;
%x=rand(1,len);
%p0=1-(0.5)^(1/8)
p0=0.35
z=floor( x/(1-p0) );
%sz=binOut('tst.dat',z)
p=sum(z)/length(z), q=1-p;


%z=x; len=length(z); p=0.35


if p>0.43
   bin=z;
elseif p>0.375
   %[bin,len,nrs,resid]=encode_block3(z);
   z(length(z))=0;   [bin,len,nrs,resid]=encode_block3_n0s(z);
   99999
   %[zr,ptr]=decode_block3(bin,len,1);
   [zr,ptr]=decode_block3_n0s(bin,length(z)-sum(z),1);
   plot(double(z)-double(zr))
elseif p>0.31
   zlen=z(length(z))
   %[bin,len,nrs,resid,codebook]=encode_block5(z);
   [bin,len,nrs,resid,codebook]=encode_block5_n0s(z);
   88888
   %[zr,ptr]=decode_block5(bin,len,1);
   [zr,ptr]=decode_block5_n0s(bin,length(z)-sum(z),1);
   plot(double(z)-double(zr))
else
   r=golomb(z);
      
   [bin,codebook]=encode_stationary_source(r,p0); %codebook %%%%%%%%%%%
   [rr,ptr]=decode_stationary_source_lenr(bin,codebook,length(r),1);
   %[rr,ptr]=decode_stationary_source_sumr(bin,codebook,length(z),1);
   plot(rr-r)
   %difptr=ptr-length(bin)
end

comp=length(bin)/len;
h=-(p*log2(p)+q*log2(q))
expanssion=comp/h;
inefficiency=(expanssion-1)*100

fprintf('\n')

