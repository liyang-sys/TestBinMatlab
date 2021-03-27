function [ ldr2hdr ] = Linearization2( ldrtohdr )
%对输入ldrtohdr进行线性延拓，即将1X256扩展为1X32768；
%   这里的输入ldrtohdr是在编码前就计算出的从LDR到HDR的全局色调映射，是最原始的版本的ldrtohdr；
%   这里的输出ldr2hdr可以看作是Linearization函数得到的hdrtoldr映射的反向映射。

ldr2hdr=zeros(1,32768);
ldr2hdr(1)=0;
jj=2;
ii=2;
th=1;
x1=0;y1=0;
x2=ldrtohdr(ii);y2=ii-1;

while jj<32768
    if (255*(jj-1))/32767<th
        ldr2hdr(jj)=((x2-x1)*((255*(jj-1))/32767)+y2*x1-y1*x2)/(y2-y1);
    else
        th=th+1;
        x1=x2;y1=y2;
        y2=ii;
        ii=ii+1;
        x2=ldrtohdr(ii);
        ldr2hdr(jj)=((x2-x1)*((255*(jj-1))/32767)+y2*x1-y1*x2)/(y2-y1);
    end
    jj=jj+1;
end
ldr2hdr(32768)=((x2-x1)*255+y2*x1-y1*x2)/(y2-y1);

end
