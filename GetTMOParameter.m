function [  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( input, isfloat )
%此函数用于获取构建ToneMapping曲线所需要的参数
%   此处显示详细说明
max_hdr=65535;
count=size(input,3);
input=double(input);
%%%计算最大值、最小值和对数最大值、对数最小值
if count == 1   %%单通道，灰度图像
    if isfloat == 1
         y= double(input);
    else
         y= double(input) / double(max_hdr);
    end
else    %%三通道，彩色图像
    if isfloat==1
        y=0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3);
    else
        y=(0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3))/max_hdr;
    end
end
y(y<0)=0;
ly=(y==0)+y; logy=log(ly); %求logy
cnt=sum(sum(y~=0));
lav=sum(sum(y))/cnt; llav=sum(sum(logy))/cnt; %%求平均值，log平均值，以及最大值和最小值
maxy=max(max(y)); miny=min(min(y(y>0)));%%求y的最大值和非零的最小值

maxl=log(maxy); minl=log(miny);
 %%%求出参数m
 if maxl <= minl
     m=0.3;
 else
     k=double((maxl-llav) / (maxl-minl));
     k(k==inf)=0;
     if k>0.0
         m=0.3+0.7*(k^1.4);
     else
         m=0.3;
     end
 end

end

