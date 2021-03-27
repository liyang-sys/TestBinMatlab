clc;
[ outarray, H, W, D, ID, scale] = pfmread_op('E:\程序代码\色调映射测试\pfm\gry\memorial_o876_gry.pfm');
input=outarray;
%此函数是根据JPEGXT里面的profile c的TMO建立的tonemapping函数
%  输入分别为：亮度矩阵， 位深度， 以及是否是浮点数
%  输出为一个从ldr映射到hdr的表；
isfloat=1; precision=16;
max_ldr=256;
max_hdr=double(2^precision - 1);
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

% if miny==0 %%避免log函数出现log0的情况，如果miny=0，则改为找第二小的值
%     temp=y; x=(temp==0);
%     temp(x)=nan;
%     miny=min(min(temp));
% end

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
 %%%计算TMO
 ldrtohdr=zeros(1, max_ldr);
 for ia=1:max_ldr
     if isfloat == 1
         out = double((ia-1) / max_ldr);
         in=((lav^m * out) / (1.0 - out))^2.2;
         if in<0.0
             in=0.0; end
         ldrtohdr(ia)=in;         
     else
         out = double((ia-1) / max_ldr);
         in=max_hdr * (miny + (maxy-miny) * (lav^m) * (out/(1.0-out)));
         if in<0.0
             in=0.0; end
         if in >max_hdr
             in=max_hdr; end
         ldrtohdr(ia)=in;
     end
 end


