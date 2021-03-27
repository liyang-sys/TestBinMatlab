function [ imgtohdr] = Linearization3_mod( hdrtoimg, range )
% function [ imgtohdr, maxm] = Linearization3_mod( hdrtoimg, range)
%求输入的hdrtoimg的反向TMO。
%   这里的hdrtoimg是经过m=f*mh+(1-f)*ml得到的；

len=uint32(range)+1;
imgtohdr=zeros(1, len);
imgtohdr(1)=0;
aj=2;
ai=2;
x1=0;y1=0;
x2=1;y2=hdrtoimg(ai);

maxm=max(hdrtoimg);
while aj<=len
    idx=(aj-1)/double(len-1)*maxm;
    if idx<=y2
        imgtohdr(aj)=(idx+y2*x1-y1*x2)/(y2-y1);
        aj=aj+1;
    else
        x1=x2;y1=y2;
        x2=ai;
        ai=ai+1;
        y2=hdrtoimg(ai);    
    end
end

end