function [ img ] = tmo( hdr, ldrtohdrname, f )
%将hdr通过tmo映射到相应的img
%   ldrtohdrname是原始ldrtohdr映射，通过f来控制mh和ml的权重，得到相应的tmo。

fid1=fopen(ldrtohdrname,'r');
ldrtohdr=fread(fid1,'uint16');
ldrtohdr=ldrtohdr';
fclose(fid1);

ml=Linearization(ldrtohdr);
mh=0:32767;
m=f*mh+(1-f)*ml;

[h,w,d]=size(hdr);
img=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            t=hdr(ii,jj,kk);
            v=m(t+1);
            img(ii,jj,kk)=v;
        end
    end
end

end

