function [ imgtoldr ] = Linearization4( ldrtohdr, m, ml )
%根据输入的ldrtohdr得到一个从img到ldr的映射,其中img是相关的HDR映射图像.
%   这里的输入ldrtohdr是在编码前就计算出的从LDR到HDR的全局色调映射，是最原始的版本的ldrtohdr。

idx=ldrtohdr(2)+1;
x1=0;y1=0;
x2=m(idx); y2=ml(idx);
ii=1;jj=2;

imgtoldr=zeros(1,32768);
while 1
    if ii<=x2
       y=((y2-y1)*(ii-1)+y1*x2-y2*x1)/(x2-x1);
       imgtoldr(ii)=y;
       ii=ii+1;
    else
       x1=x2;y1=y2;
       jj=jj+1;
       if jj>256
           break;
       end
       idx=ldrtohdr(jj)+1;
       x2=m(idx);y2=ml(idx);
    end
end

if ii<32768
   imgtoldr(ii:32768)=255; 
end

end

