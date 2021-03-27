function [ img2hdr ] = Linearization_mod( f, lav, m, maxy)
%��������õ�һ���������غ��img2hdr���
%   ���������lav,m��TMO���ӵĲ�����
h=0:0.0001:255;
h2im=h*(1-f)+f*(1-lav^m./((h/255.0*maxy).^(1/2.2)+lav^m))*255.0;

[~,len]=size(h2im);
img2hdr=zeros(1,65536);
ia=2;
ja=2;
x1=0.0; y1=0;
x2=1.0; y2=double(h2im(ja));
while 1
    idx=double(ia-1)/65535.0*255.0;
    if idx<y2
        v=(idx+double(y2*x1)-double(y1*x2))/(y2-y1);
        img2hdr(ia)=v/double(len)*255.0;
        ia=ia+1;
    else
        if idx==y2
             img2hdr(ia)=x2/double(len)*255.0;
             ia=ia+1;
        end
        ja=ja+1;
        if ja>len 
            v=(idx+double(y2*x1)-double(y1*x2))/(y2-y1);
            img2hdr(ia)=v/double(len)*255.0;
%             img2hdr(ia)=len; 
            break;
        end
        x1=x2;y1=y2;
        x2=ja-1;
        y2=double(h2im(ja));
    end
end
img2hdr(ia+1:65536)=img2hdr(ia);


end