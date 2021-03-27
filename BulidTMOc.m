function [ ldr2hdr, lav, llav, m, maxy, miny, maxl, minl] = BulidTMOc( input, isfloat )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
max_ldr=256;
max_hdr=65535;
count=size(input,3);
input=double(input);
%%%�������ֵ����Сֵ�Ͷ������ֵ��������Сֵ
if count == 1   %%��ͨ�����Ҷ�ͼ��
    if isfloat == 1
         y= double(input);
    else
         y= double(input) / double(max_hdr);
    end
else    %%��ͨ������ɫͼ��
    if isfloat==1
        y=0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3);
    else
        y=(0.2126*input(:,:,1)+0.7152*input(:,:,2)+0.0722*input(:,:,3))/max_hdr;
    end
end
y(y<0)=0;
ly=(y==0)+y; logy=log(ly); %��logy
cnt=sum(sum(y~=0));
lav=sum(sum(y))/cnt; llav=sum(sum(logy))/cnt; %%��ƽ��ֵ��logƽ��ֵ���Լ����ֵ����Сֵ
maxy=max(max(y)); miny=min(min(y(y>0)));%%��y�����ֵ�ͷ������Сֵ

maxl=log(maxy); minl=log(miny);
 %%%�������m
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
 %%%����TMO
 ldr2hdr=zeros(1, max_ldr);
 for ia=1:max_ldr
     if isfloat == 1
         out = double((ia-1) / max_ldr);
         in=((lav^m * out) / (1.0 - out))^2.2;
         if in<0.0
             in=0.0; end
         ldr2hdr(ia)=in;         
     else
         out = double((ia-1) / max_ldr);
         in=max_hdr * (miny + (maxy-miny) * (lav^m) * (out/(1.0-out)));
         if in<0.0
             in=0.0; end
         if in >max_hdr
             in=max_hdr; end
         ldr2hdr(ia)=in;
     end
 end


end

