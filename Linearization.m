function [ img2hdr, len ] = Linearization( miny, f, lav, m)
%根据输入得到一个线性延拓后的img2hdr输出
%   这里的输入lav,m是TMO算子的参数，miny是原始hdr输入的最小值。
h=0:miny:255;
h2im=h*f+(1-f)*(1-lav^m./(h.^(1/2.2)+lav^m))*255.0;

[~,len]=size(h2im);
img2hdr=zeros(1,65536);
ia=2;
ja=2;
x1=0; y1=0;
x2=1; y2=double(h2im(ja));
while 1
    idx=double(ia-1)/65535.0*255.0;
    if idx<y2
        v=(idx+double(y2*x1)-double(y1*x2))/(y2-y1);
        img2hdr(ia)=v;
        ia=ia+1;
    else
        if idx==y2
             img2hdr(ia)=x2;
             ia=ia+1;
        end
        ja=ja+1;
        if ja>len           
            img2hdr(ia)=(idx+double(y2*x1)-double(y1*x2))/(y2-y1);
%             img2hdr(ia)=len; 
            break;
        end
        x1=x2;y1=y2;
        x2=ja-1;
        y2=double(h2im(ja));
    end
end
img2hdr(ia+1:65536)=img2hdr(ia);





% [~,len]=size(h2im);
% img2hdr=zeros(1,256);
% ia=2;
% ja=2;
% x1=0; y1=0;
% x2=1; y2=double(h2im(ja));
% while 1
%     if ia-1<y2
%         v=(double(ia-1)+double(y2*x1)-double(y1*x2))/(y2-y1);
%         img2hdr(ia)=v;
%         ia=ia+1;
%     else
%         if ia-1==y2
%              img2hdr(ia)=x2;
%              ia=ia+1;
%         end
%         ja=ja+1;
%         if ja>len           
%             img2hdr(ia)=(double(ia-1)+double(y2*x1)-double(y1*x2))/(y2-y1);
% %             img2hdr(ia)=len; 
%             break;
%         end
%         x1=x2;y1=y2;
%         x2=ja-1;
%         y2=double(h2im(ja));
%     end
% end
% img2hdr(ia+1:256)=img2hdr(ia);

end

