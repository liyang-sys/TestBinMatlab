function [ img ] = tmo_mod2( hdr255, lav, m, f, maxy )
%将hdr通过tmo映射到相应的img
%输入参数lav和m是基于全局得到的，通过f来控制mh和ml的权重，得到相应的tmo。

lav=double(lav);
m=double(m);
f=double(f);
if f==0
    img=hdr255;
else
    p=(hdr255./255.0).*maxy;
    v=(1.0-lav^m./(p.^(1.0/2.2)+lav^m)).*255.0;  %<====== the JXT default tone mapping
    %v=tonemapping(p, lav, m);
    img=hdr255.*(1.0-f)+v.*f;
end

end
