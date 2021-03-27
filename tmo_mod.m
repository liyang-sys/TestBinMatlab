function [ img, ml, range, maxi ] = tmo_mod( hdr, ldrtohdr, f )
%将hdr通过tmo映射到相应的img
%   ldrtohdrname是原始ldrtohdr映射，通过f来控制mh和ml的权重，得到相应的tmo。

maxi=double(max(max(hdr)));
mini=double(min(min(hdr)));
range=uint32(maxi/mini);

ml = Linearization_mod( ldrtohdr, range, maxi );

[h,w,d]=size(hdr);
img=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            p=hdr(ii,jj,kk);
            idx=p/maxi*double(range)+1;
            a2=double(ceil(idx)); b2=ml(a2);
            a1=a2-1; b1=ml(a1);
            t=b1*a2-b2*a1;
            y=(b2-b1)*idx+t;
            v=f*(p/maxi*255.0)+(1-f)*y;  %%m=f*mh+(1-f)*ml
            img(ii,jj,kk)=v;
        end
    end
end

end

