function [ hdr, ldr ] = tmo2_mod2( img, f, lav, m, maxy )
%将img映射到hdr和ldr
%   maxy是原始输入的HDR图像的最大值
%-------------------恢复hdr图像------------------------
[h,w]=size(img);
hdr=zeros(h,w);
if  (0<f)&&(f<1)
     [ img2hdr ] = Linearization_mod( f, lav, m, maxy);
    for ii=1:h
        for jj=1:w 
            if img(ii,jj)>0
                p=double(img(ii,jj)/255.0*65535.0+1.0);
                a2=double(ceil(p)); 
                b2=double(img2hdr(a2));
                a1=a2-1; b1=double(img2hdr(a1));
                t=b1*a2-b2*a1;
                u=(b2-b1)*p+t;
                hdr(ii,jj)=u;          
            else
                hdr(ii,jj)=0;
            end
        end
    end
    hdr(hdr>255.0)=255.0;
    %----------------生成ldr图像--------------------------
    [ldr] = tmo_mod2( hdr, lav, m, 1, maxy );
elseif f==1
    ldr=img;
    out=double(img)./255.0;
    p=double(lav)^double(m);
    in=((out.*p)./(1-out)).^2.2;
    in(in<0.0)=0.0;
    in(in>maxy)=maxy;
    hdr=in./maxy.*255.0;
%     for ii=1:h
%         for jj=1:w  
%             out=double(img(ii,jj))/255.0;
%             p=double(lav)^double(m);
%             in=double(((p*out) / (1.0-out))^2.2);
%             if in < 0.0
%                 in = 0.0; 
%             elseif in>maxy
%                 in=maxy;
%             end
%             hdr(ii,jj)=double(in)/maxy*255.0;
%         end
%     end
else
    hdr=img;
    %----------------生成ldr图像--------------------------
    [ldr] = tmo_mod2( hdr, lav, m, 1, maxy );
end


end